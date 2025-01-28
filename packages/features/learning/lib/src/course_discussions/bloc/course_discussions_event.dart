part of 'course_discussions_bloc.dart';

sealed class CourseDiscussionsEvent extends Equatable {
  const CourseDiscussionsEvent();
}

class CourseDiscussionsMessagesFetched extends CourseDiscussionsEvent {
  const CourseDiscussionsMessagesFetched();

  @override
  List<Object> get props => [];
}

class CourseDiscussionMessageChanged extends CourseDiscussionsEvent {
  const CourseDiscussionMessageChanged(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class CourseDiscussionMessageSubmitted extends CourseDiscussionsEvent {
  const CourseDiscussionMessageSubmitted();

  @override
  List<Object> get props => [];
}