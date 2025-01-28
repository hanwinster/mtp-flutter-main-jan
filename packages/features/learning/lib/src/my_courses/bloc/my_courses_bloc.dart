import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'my_courses_event.dart';

part 'my_courses_state.dart';

class MyCoursesBloc extends Bloc<MyCoursesEvent, MyCoursesState> {
  MyCoursesBloc({
    ObserveUserCoursesUseCase? observeCoursesUseCase,
    CancelCourseUseCase? cancelCourseUseCase,
  })  : _observeUserCoursesUseCase = observeCoursesUseCase ?? getIt(),
        _cancelCourseUseCase = cancelCourseUseCase ?? getIt(),
        super(const MyCoursesState()) {
    on<MyCoursesOngoingCoursesFetched>(_onOngoingCoursesFetched,
        transformer: restartable());
    on<MyCoursesOngoingCoursesRefreshed>(_onOngoingCoursesRefreshed,
        transformer: restartable());
    on<MyCoursesCompletedCoursesFetched>(_onCompletedCoursesFetched,
        transformer: restartable());
    on<MyCoursesCompletedCoursesRefreshed>(_onCompletedCoursesRefreshed,
        transformer: restartable());
    on<MyCoursesCancelCourseRequested>(_onCancelCourseRequested);
    on<MyCoursesPageChanged>(_onPageChanged);
  }

  final ObserveUserCoursesUseCase _observeUserCoursesUseCase;
  final CancelCourseUseCase _cancelCourseUseCase;

  Future<void> _onOngoingCoursesFetched(
    MyCoursesOngoingCoursesFetched event,
    Emitter<MyCoursesState> emit,
  ) async {
    emit(
      state.copyWith(
        ongoingCoursesUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeUserCoursesUseCase(
        const ObserveUserCoursesUseCaseRequest(
          filter: CourseFilter(),
          completed: false,
        ),
      ),
      onData: (result) {
        return state.copyWith(
          ongoingCoursesUiState: UiState.fromResult(result),
        );
      },
      onError: (e, s) {
        logger.e('Error', e, s);
        return state.copyWith(
          ongoingCoursesUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  Future<void> _onCompletedCoursesFetched(
    MyCoursesCompletedCoursesFetched event,
    Emitter<MyCoursesState> emit,
  ) async {
    emit(
      state.copyWith(
        completedCoursesUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeUserCoursesUseCase(
        const ObserveUserCoursesUseCaseRequest(
          filter: CourseFilter(),
          completed: true,
        ),
      ),
      onData: (result) {
        return state.copyWith(
          completedCoursesUiState: UiState.fromResult(result),
        );
      },
      onError: (e, s) {
        logger.e('Error', e, s);
        return state.copyWith(
          completedCoursesUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  Future<void> _onPageChanged(
    MyCoursesPageChanged event,
    Emitter<MyCoursesState> emit,
  ) async {
    emit(state.copyWith(currentPageIndex: event.pageIndex));
  }

  Future<void> _onOngoingCoursesRefreshed(
    MyCoursesOngoingCoursesRefreshed event,
    Emitter<MyCoursesState> emit,
  ) async {
    //TODO: add force refresh
    add(const MyCoursesOngoingCoursesFetched());
  }

  Future<void> _onCompletedCoursesRefreshed(
    MyCoursesCompletedCoursesRefreshed event,
    Emitter<MyCoursesState> emit,
  ) async {
    //TODO: add force refresh
    add(const MyCoursesCompletedCoursesFetched());
  }

  Future<void> _onCancelCourseRequested(
    MyCoursesCancelCourseRequested event,
    Emitter<MyCoursesState> emit,
  ) async {
    emit(
      state.copyWith(courseCancellationUiState: const UiStateInProgress()),
    );
    try {
      await _cancelCourseUseCase(
        CancelCourseUseCaseRequest(
          courseId: event.courseId,
        ),
      );
      emit(
        state.copyWith(courseCancellationUiState: const UiStateSuccess('')),
      );
    } catch (e, s) {
      logger.e('Error', e, s);
      emit(
        state.copyWith(courseCancellationUiState: UiStateFailure.fromError(e)),
      );
    }
  }
}
