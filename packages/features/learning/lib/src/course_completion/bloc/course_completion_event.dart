part of 'course_completion_bloc.dart';

sealed class CourseCompletionEvent extends Equatable {
  const CourseCompletionEvent();
}

class CourseCompletionLearnerChanged extends CourseCompletionEvent {
  const CourseCompletionLearnerChanged(this.learnerUiState);

  final UiState<CourseLearner> learnerUiState;

  @override
  List<Object> get props => [learnerUiState];
}
