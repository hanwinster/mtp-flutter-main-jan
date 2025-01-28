import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:ui/ui.dart';

part 'course_list_event.dart';
part 'course_list_state.dart';

const _debounceDuration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  CourseListBloc({
    CourseFilter? filter,
    ObserveCoursesUseCase? observeCoursesUseCase,
    GetCoursesUseCase? getCoursesUseCase,
  })  : _observeCoursesUseCase = observeCoursesUseCase ?? getIt(),
        _getCoursesUseCase = getCoursesUseCase ?? getIt(),
        super(CourseListState(filter: filter ?? const CourseFilter())) {
    on<CourseListCoursesFetched>(_onCoursesFetched, transformer: restartable());
    on<CourseListKeywordChanged>(_onKeywordChanged,
        transformer: debounce(_debounceDuration));
  }

  final ObserveCoursesUseCase _observeCoursesUseCase;
  final GetCoursesUseCase _getCoursesUseCase;

  Future<void> _onCoursesFetched(
    CourseListCoursesFetched event,
    Emitter<CourseListState> emit,
  ) async {
    final newFilter = event.filter ?? state.filter;

    emit(
      state.copyWith(
        filter: newFilter,
        coursesUiState: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _getCoursesUseCase(
        GetCoursesUseCaseRequest(
          filter: newFilter,
          page: event.pageKey,
          limit: pageSize,
        ),
      );

      bool isEmpty = result.isEmpty;
      emit(state.copyWith(
        currentPageKey: event.pageKey,
        coursesUiState: isEmpty ? const UiStateEmpty() : UiStateSuccess(result),
      ));
    } catch (e, s) {
      logger.e('Error', e, s);
      emit(
        state.copyWith(
          coursesUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  void _onKeywordChanged(
    CourseListKeywordChanged event,
    Emitter<CourseListState> emit,
  ) {
    emit(state.copyWith(
      filter: state.filter.copyWith(keyword: event.keyword),
    ));
  }
}
