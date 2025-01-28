part of 'course_intro_bloc.dart';

sealed class CourseIntroEvent extends Equatable {
  const CourseIntroEvent();
}

class CourseIntroCourseFetched extends CourseIntroEvent {
  const CourseIntroCourseFetched();

  @override
  List<Object> get props => [];
}

class CourseIntroLearnerChanged extends CourseIntroEvent {
  final UiState<CourseLearner> learnerUiState;

  const CourseIntroLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}