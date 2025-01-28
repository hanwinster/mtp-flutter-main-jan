part of 'offline_courses_bloc.dart';

sealed class OfflineCoursesEvent extends Equatable {
  const OfflineCoursesEvent();
}

class OfflineCoursesFetched extends OfflineCoursesEvent {
  const OfflineCoursesFetched();

  @override
  List<Object> get props => [];
}

class OfflineCourseMediasFetched extends OfflineCoursesEvent {
  const OfflineCourseMediasFetched();

  @override
  List<Object> get props => [];
}

class OfflineCourseRemoved extends OfflineCoursesEvent {
  const OfflineCourseRemoved({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object> get props => [courseId];
}

class OfflineCourseMediaRemoved extends OfflineCoursesEvent {
  const OfflineCourseMediaRemoved({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
