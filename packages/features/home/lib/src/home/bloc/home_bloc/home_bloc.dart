import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
      {ObserveCourseCategoriesUseCase? observeCourseCategoriesUseCase,
      GetCoursesUseCase? getCoursesUseCase,
      GetCurrentVersionUseCase? getCurrentVersionUseCase})
      : _observeCourseCategoriesUseCase =
            observeCourseCategoriesUseCase ?? getIt(),
        _getCoursesUseCase = getCoursesUseCase ?? getIt(),
        _getCurrentVersionUseCase = getCurrentVersionUseCase ?? getIt(),
        super(HomeState.empty()) {
    on<HomeCourseCategoriesFetched>(_handleCourseCategoriesFetched);
    on<HomeCoursesFetched>(_handleCoursesFetched);
    on<VersionCheckRequested>(_getCurrentVersion);
  }

  final ObserveCourseCategoriesUseCase _observeCourseCategoriesUseCase;
  final GetCoursesUseCase _getCoursesUseCase;
  final GetCurrentVersionUseCase? _getCurrentVersionUseCase;
  Future<void> _handleCourseCategoriesFetched(
    HomeCourseCategoriesFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      courseCategoriesUiState: const UiStateInProgress(),
    ));
    await emit.forEach(
      _observeCourseCategoriesUseCase(),
      onData: (result) {
        return state.copyWith(
          courseCategoriesUiState: UiState.fromResult(result),
        );
      },
      onError: (e, s) {
        return state.copyWith(
          courseCategoriesUiState: UiStateFailure.fromError(e),
        );
      },
    );
  }

  Future<void> _handleCoursesFetched(
    HomeCoursesFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      coursesUiState: const UiStateInProgress(),
    ));

    try {
      final result = await _getCoursesUseCase(const GetCoursesUseCaseRequest(
        page: 1,
        limit: 10,
        filter: CourseFilter(),
      ));
      emit(state.copyWith(
        coursesUiState: UiStateSuccess(result),
      ));
    } catch (e, s) {
      logger.e('Error fetching courses', e, s);
      emit(
        state.copyWith(
          coursesUiState: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _getCurrentVersion(
    VersionCheckRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      versionUiState: const UiStateInProgress(),
    ));
    try {
      final result = await _getCurrentVersionUseCase?.call();
      if (result != null) {
        emit(state.copyWith(
          versionUiState: UiStateSuccess(result),
        ));
      } else {
        emit(state.copyWith(
          versionUiState: UiStateFailure.other('Version check failed'),
        ));
      }
    } catch (e, s) {
      logger.e('Error checking version', e, s);
      emit(state.copyWith(
        versionUiState: UiStateFailure.fromError(e),
      ));
    }
  }
}
