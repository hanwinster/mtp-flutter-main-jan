part of 'course_dashboard_bloc.dart';

final class CourseDashboardState extends Equatable {
  const CourseDashboardState({
    required this.courseId,
    this.courseUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
  });

  final String courseId;
  final UiState<Course> courseUiState;
  final UiState<CourseLearner> courseLearnerUiState;

  factory CourseDashboardState.create({
    required String courseId,
  }) {
    return CourseDashboardState(
      courseId: courseId,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        courseUiState,
        courseLearnerUiState,
      ];

  CourseDashboardState copyWith({
    String? courseId,
    UiState<Course>? courseUiState,
    UiState<CourseLearner>? courseLearnerUiState,
  }) {
    return CourseDashboardState(
      courseId: courseId ?? this.courseId,
      courseUiState: courseUiState ?? this.courseUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
    );
  }
}
