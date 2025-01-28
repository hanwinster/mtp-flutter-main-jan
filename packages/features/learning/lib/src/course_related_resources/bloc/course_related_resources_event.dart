part of 'course_related_resources_bloc.dart';

sealed class CourseRelatedResourcesEvent extends Equatable {
  const CourseRelatedResourcesEvent();
}

class CourseRelatedResourcesFetched extends CourseRelatedResourcesEvent {
  const CourseRelatedResourcesFetched();

  @override
  List<Object> get props => [];
}