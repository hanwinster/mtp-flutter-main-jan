part of 'learning_activity_bloc.dart';

final class LearningActivityState extends Equatable {
  const LearningActivityState({
    required this.activityId,
    required this.courseId,
    required this.materialKey,
    this.activitiesUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
  });

  final String activityId;
  final String courseId;
  final String materialKey;
  final UiState<UiLearningActivity> activitiesUiState;
  final UiState<CourseLearner> courseLearnerUiState;

  factory LearningActivityState.create({
    required String activityId,
    required String courseId,
    required String materialKey,
  }) {
    return LearningActivityState(
      activityId: activityId,
      courseId: courseId,
      materialKey: materialKey,
    );
  }

  @override
  List<Object> get props =>
      [
        activityId,
        courseId,
        materialKey,
        activitiesUiState,
        courseLearnerUiState,
      ];

  LearningActivityState copyWith({
    String? activityId,
    String? courseId,
    String? materialKey,
    UiState<UiLearningActivity>? activitiesUiState,
    UiState<CourseLearner>? courseLearnerUiState,
  }) {
    return LearningActivityState(
      activityId: activityId ?? this.activityId,
      courseId: courseId ?? this.courseId,
      materialKey: materialKey ?? this.materialKey,
      activitiesUiState: activitiesUiState ?? this.activitiesUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
    );
  }
}