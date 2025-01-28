part of 'course_related_resources_bloc.dart';

final class CourseRelatedResourcesState extends Equatable {
  const CourseRelatedResourcesState({
    required this.courseId,
    this.resourcesUiState = const UiStateInitial(),
  });

  final String courseId;
  final UiState<List<Resource>> resourcesUiState;

  factory CourseRelatedResourcesState.create({
    required String courseId,
  }) {
    return CourseRelatedResourcesState(
      courseId: courseId,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        resourcesUiState,
      ];

  CourseRelatedResourcesState copyWith({
    String? courseId,
    UiState<List<Resource>>? resourcesUiState,
  }) {
    return CourseRelatedResourcesState(
      courseId: courseId ?? this.courseId,
      resourcesUiState: resourcesUiState ?? this.resourcesUiState,
    );
  }
}