part of 'course_navigation_bloc.dart';

sealed class CourseNavigationEvent extends Equatable {
  const CourseNavigationEvent();
}

class CourseNavigationDirectionChanged extends CourseNavigationEvent {
  final CourseNavigationDirection direction;

  const CourseNavigationDirectionChanged(this.direction);

  @override
  List<Object> get props => [direction];
}