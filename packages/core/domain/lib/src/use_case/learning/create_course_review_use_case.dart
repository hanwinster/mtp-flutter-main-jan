import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CreateCourseReviewUseCaseRequest extends Equatable {
  const CreateCourseReviewUseCaseRequest({
    required this.courseId,
    required this.rating,
    required this.remark,
  });

  final String courseId;
  final int rating;
  final String remark;

  @override
  List<Object?> get props => [
        courseId,
        rating,
        remark,
      ];
}

class CreateCourseReviewUseCase {
  CreateCourseReviewUseCase({
    CourseReviewRepository? courseReviewRepository,
  }) : _courseReviewRepository = courseReviewRepository ?? getIt();

  final CourseReviewRepository _courseReviewRepository;

  Future<void> call(CreateCourseReviewUseCaseRequest request) {
    return _courseReviewRepository.createCourseReview(
      courseId: request.courseId,
      rating: request.rating,
      remark: request.remark,
    );
  }
}
