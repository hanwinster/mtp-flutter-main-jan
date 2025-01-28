part of 'course_reviews_bloc.dart';

final class CourseReviewsState extends Equatable {
  const CourseReviewsState({
    required this.courseId,
    this.reviewsUiState = const UiStateInitial(),
  });

  final String courseId;
  final UiState<List<CourseReview>> reviewsUiState;

  factory CourseReviewsState.create({
    required String courseId,
  }) {
    return CourseReviewsState(
      courseId: courseId,
    );
  }

  @override
  List<Object> get props => [courseId, reviewsUiState];

  CourseReviewsState copyWith({
    String? courseId,
    UiState<List<CourseReview>>? reviewsUiState,
  }) {
    return CourseReviewsState(
      courseId: courseId ?? this.courseId,
      reviewsUiState: reviewsUiState ?? this.reviewsUiState,
    );
  }
}