part of 'course_dashboard_bloc.dart';

sealed class CourseDashboardEvent extends Equatable {
  const CourseDashboardEvent();
}

class CourseDashboardCourseFetched extends CourseDashboardEvent {
  const CourseDashboardCourseFetched(
    this.courseId,
  );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}


class CourseDashboardLearnerChanged extends CourseDashboardEvent {
  final UiState<CourseLearner> learnerUiState;

  const CourseDashboardLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}

class CourseDashboardEvaluationsFetched extends CourseDashboardEvent {
  const CourseDashboardEvaluationsFetched(
      this.courseId,
      );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}

