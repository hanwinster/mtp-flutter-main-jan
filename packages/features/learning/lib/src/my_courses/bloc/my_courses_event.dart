part of 'my_courses_bloc.dart';

sealed class MyCoursesEvent extends Equatable {
  const MyCoursesEvent();
}

class MyCoursesOngoingCoursesFetched extends MyCoursesEvent {
  const MyCoursesOngoingCoursesFetched();

  @override
  List<Object?> get props => [];
}

class MyCoursesOngoingCoursesRefreshed extends MyCoursesEvent {
  const MyCoursesOngoingCoursesRefreshed();

  @override
  List<Object?> get props => [];
}

class MyCoursesCompletedCoursesFetched extends MyCoursesEvent {
  const MyCoursesCompletedCoursesFetched();

  @override
  List<Object?> get props => [];
}

class MyCoursesCompletedCoursesRefreshed extends MyCoursesEvent {
  const MyCoursesCompletedCoursesRefreshed();

  @override
  List<Object?> get props => [];
}

class MyCoursesCancelCourseRequested extends MyCoursesEvent {
  const MyCoursesCancelCourseRequested(this.courseId);
  final String courseId;

  @override
  List<Object?> get props => [];
}

class MyCoursesPageChanged extends MyCoursesEvent {
  const MyCoursesPageChanged(this.pageIndex);

  final int pageIndex;

  @override
  List<Object> get props => [pageIndex];
}

