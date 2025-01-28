import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'course_intro_event.dart';

part 'course_intro_state.dart';

class CourseIntroBloc extends Bloc<CourseIntroEvent, CourseIntroState> {
  CourseIntroBloc({
    required String courseId,
    required String materialKey,
    required bool isOfflineMode,
    ObserveCourseUseCase? observeCourseUseCase,
  })  : _observeCourseUseCase = observeCourseUseCase ?? getIt(),
        super(CourseIntroState.create(
          courseId: courseId,
          materialKey: materialKey,
        )) {
    on<CourseIntroCourseFetched>(
      _handleCourseFetched,
      transformer: restartable(),
    );
    on<CourseIntroLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
  }

  final ObserveCourseUseCase _observeCourseUseCase;

  FutureOr<void> _handleCourseFetched(
    CourseIntroCourseFetched event,
    Emitter<CourseIntroState> emit,
  ) async {
    emit(
      state.copyWith(
        courseUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeCourseUseCase(
        ObserveCourseUseCaseRequest(
          courseId: state.courseId,
          forceRefresh:
              false, // we have just fetched the course, no need to force refresh
        ),
      ),
      onData: (result) => state.copyWith(
        courseUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        courseUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleLearnerChanged(
    CourseIntroLearnerChanged event,
    Emitter<CourseIntroState> emit,
  ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }
}
