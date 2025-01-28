import 'package:database/database.dart';

abstract class CourseDownloadStatusDao {
  Future<void> upsertEntity({
    required CourseDownloadStatusEntity entity,
  });

  Stream<CourseDownloadStatusEntity?> observeEntity({
    required String courseId,
  });

  Future<void> markAsHandled({
    required String courseId,
  });

  Future<void> deleteEntity({
    required String courseId,
  });
}
