part of 'course_list_bloc.dart';

sealed class CourseListEvent extends Equatable {
  const CourseListEvent();
}

class CourseListCoursesFetched extends CourseListEvent {
  const CourseListCoursesFetched({
    required this.pageKey,
    this.filter,
  });

  final int pageKey;
  final CourseFilter? filter;

  @override
  List<Object?> get props => [pageKey, filter];
}

class CourseListKeywordChanged extends CourseListEvent {
  const CourseListKeywordChanged(this.keyword);

  final String keyword;

  @override
  List<Object> get props => [keyword];
}