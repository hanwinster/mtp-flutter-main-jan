part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();
}

class CourseFetched extends CourseEvent {
  const CourseFetched(
    this.courseId,
  );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}