import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class CourseRepository {
  Stream<Result<List<Course>>> observeCourses({
    required int page,
    required int limit,
    required String keyword,
    required String categoryId,
  });

  Future<List<Course>> getCourses({
    required int page,
    required int limit,
    required String keyword,
    required String categoryId,
  });

  Stream<Result<List<Course>>> observeUserCourses({
    required String keyword,
    required String categoryId,
    required bool completed,
  });

  Stream<Result<Course>> observeCourse({
    required String courseId,
    bool forceRefresh = false,
  });

  Stream<List<OfflineCourse>> observeOfflineCourses();

  Stream<List<OfflineCourseMedia>> observeOfflineCourseMedias();

  Future<void> saveOfflineCourseMedia({
    required String courseId,
    required String url,
    required String title,
  });

  Stream<CourseDownloadStatus?> observeCourseDownloadStatus({
    required String courseId,
  });

  Future<void> markCourseDownloadStatusAsHandled({
    required String courseId,
  });

  Future<void> deleteOfflineCourse({
    required String courseId,
  });

  Future<void> deleteOfflineCourseMedia({
    required String id,
  });

  Future<XApiCourse> getXApiCourse({
    required String courseId,
  });

  Stream<Result<CourseLearner>> observeCourseLearner({
    required String learnerId,
  });

  Future<CourseLearner?> getCourseLearnerByCourseId({
    required String courseId,
  });

  Future<CourseLearner> takeCourse({
    required String courseId,
  });

  Future<CourseMaterial?> updateCompletion({
    required String courseId,
    required String currentSection,
    required CourseNavigationDirection direction,
  });

  Future<void> cancelCourse({
    required String courseId,
  });
}
