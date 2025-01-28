part of 'course_detail_bloc.dart';

sealed class CourseDetailEvent extends Equatable {
  const CourseDetailEvent();
}

class CourseDetailFetched extends CourseDetailEvent {
  const CourseDetailFetched(
    this.courseId,
  );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}

class CourseDetailEnrolled extends CourseDetailEvent {
  const CourseDetailEnrolled(
    this.courseId,
  );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}

class CourseDetailDownloaded extends CourseDetailEvent {
  const CourseDetailDownloaded(
    this.courseId,
  );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}

class CourseDetailResourceRequested extends CourseDetailEvent {
  const CourseDetailResourceRequested(
    this.url,
  );

  final String url;

  @override
  List<Object> get props => [url];
}

class CourseDetailDownloadStatusFetched extends CourseDetailEvent {
  const CourseDetailDownloadStatusFetched(
    this.courseId,
  );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}

class CourseDetailDownloadStatusHandled extends CourseDetailEvent {
  const CourseDetailDownloadStatusHandled(
    this.courseId,
  );

  final String courseId;

  @override
  List<Object> get props => [courseId];
}
