part of 'course_completion_bloc.dart';

final class CourseCompletionState extends Equatable {
  const CourseCompletionState({
    required this.courseId,
    this.certificateState = const UiStateInitial(),
    this.learnerUiState = const UiStateInitial(),
  });

  final String courseId;
  final UiState<String> certificateState;
  final UiState<CourseLearner> learnerUiState;

  factory CourseCompletionState.create({
    required String courseId,
  }) {
    return CourseCompletionState(
      courseId: courseId,
    );
  }

  @override
  List<Object> get props => [courseId, learnerUiState, certificateState];

  CourseCompletionState copyWith({
    String? courseId,
    UiState<String>? certificateState,
    UiState<CourseLearner>? learnerUiState,
  }) {
    return CourseCompletionState(
      courseId: courseId ?? this.courseId,
      certificateState: certificateState ?? this.certificateState,
      learnerUiState: learnerUiState ?? this.learnerUiState,
    );
  }
}
