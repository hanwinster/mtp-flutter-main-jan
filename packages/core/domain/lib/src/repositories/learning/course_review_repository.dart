import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class CourseReviewRepository {
  Stream<Result<List<CourseReview>>> observeCourseReviews({
    required String courseId,
  });

  Future<void> createCourseReview({
    required String courseId,
    required int rating,
    required String remark,
  });
}
