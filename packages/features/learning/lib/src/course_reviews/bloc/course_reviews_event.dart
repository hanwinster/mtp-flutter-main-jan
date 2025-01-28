part of 'course_reviews_bloc.dart';

sealed class CourseReviewsEvent extends Equatable {
  const CourseReviewsEvent();
}

class CourseReviewsFetched extends CourseReviewsEvent {
  const CourseReviewsFetched();

  @override
  List<Object> get props => [];
}