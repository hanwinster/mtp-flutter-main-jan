part of 'x_api_course_bloc.dart';

sealed class XApiCourseEvent extends Equatable {
  const XApiCourseEvent();
}

class XApiCourseFetched extends XApiCourseEvent {
  const XApiCourseFetched();

  @override
  List<Object> get props => [];
}

class XApiCourseCompleted extends XApiCourseEvent {
  const XApiCourseCompleted();

  @override
  List<Object> get props => [];
}


class XApiCourseLearnerChanged extends XApiCourseEvent {
  final UiState<CourseLearner> learnerUiState;

  const XApiCourseLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}