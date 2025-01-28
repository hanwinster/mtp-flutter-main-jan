import 'dart:async';

import 'package:base/base.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

part 'course_dashboard_event.dart';

part 'course_dashboard_state.dart';

class CourseDashboardBloc
    extends Bloc<CourseDashboardEvent, CourseDashboardState> {
  CourseDashboardBloc({
    required String courseId,
    ObserveCourseUseCase? observeUserCourseUseCase,
  })  : _observeUserCourseUseCase = observeUserCourseUseCase ?? getIt(),
        super(CourseDashboardState(courseId: courseId)) {
    on<CourseDashboardCourseFetched>(
      _handleCourseFetched,
      transformer: restartable(),
    );
    on<CourseDashboardLearnerChanged>(
      _handleLearnerChanged,
      transformer: restartable(),
    );
  }

  final ObserveCourseUseCase _observeUserCourseUseCase;

  FutureOr<void> _handleCourseFetched(
    CourseDashboardCourseFetched event,
    Emitter<CourseDashboardState> emit,
  ) async {
    emit(
      state.copyWith(
        courseUiState: const UiStateInProgress(),
      ),
    );

    await emit.forEach(
      _observeUserCourseUseCase(ObserveCourseUseCaseRequest(
        courseId: event.courseId,
        forceRefresh: false, // we have just fetched the course, no need to force refresh
      )),
      onData: (result) => state.copyWith(
        courseUiState: UiState.fromResult(result),
      ),
      onError: (e, s) => state.copyWith(
        courseUiState: UiStateFailure.fromError(e),
      ),
    );
  }

  Future<void> _handleLearnerChanged(
      CourseDashboardLearnerChanged event,
      Emitter<CourseDashboardState> emit,
      ) async {
    emit(
      state.copyWith(
        courseLearnerUiState: event.learnerUiState,
      ),
    );
  }
}
