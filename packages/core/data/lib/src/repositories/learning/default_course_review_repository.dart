import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultCourseReviewRepository extends CourseReviewRepository {
  DefaultCourseReviewRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Stream<Result<List<CourseReview>>> observeCourseReviews({
    required String courseId,
  }) async* {
    try {
      yield ResultLoading();
      final response = await remoteDataSourceCall(() => _api.getCourseReviews(
            courseId: courseId.toIntOrThrow(),
          ));
      yield ResultSuccess(response.map((e) => e.toDomainModel()).toList());
    } on Exception catch (e) {
      yield ResultError(e);
    } catch (e) {
      yield ResultError(Exception(e.toString()));
    }
  }

  @override
  Future<void> createCourseReview({
    required String courseId,
    required int rating,
    required String remark,
  }) async {
    try {
      await _api.createCourseReview(
        courseId: courseId.toIntOrThrow(),
        rating: rating,
        remark: remark,
      );
    } on Exception catch (e, s) {
      logger.e('Failed to create course review', e, s);
      rethrow;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
