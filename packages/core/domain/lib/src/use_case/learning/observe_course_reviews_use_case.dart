import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseReviewsUseCaseRequest extends Equatable {
  const ObserveCourseReviewsUseCaseRequest({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object?> get props => [courseId];
}

class ObserveCourseReviewsUseCase {
  ObserveCourseReviewsUseCase({
    CourseReviewRepository? courseReviewRepository,
  }) : _courseReviewRepository = courseReviewRepository ?? getIt();

  final CourseReviewRepository _courseReviewRepository;

  Stream<Result<List<CourseReview>>> call(
      ObserveCourseReviewsUseCaseRequest request) {
    return _courseReviewRepository.observeCourseReviews(
      courseId: request.courseId,
    );
  }
}
