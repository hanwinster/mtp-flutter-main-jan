import 'package:database/database.dart';

abstract class UserCourseDao {
  Future<void> upsertEntities({
    required List<CourseEntity> entities,
  });

  Future<void> insertOrIgnoreEntities({
    required List<CourseEntity> entities,
  });

  Future<CourseEntity?> getEntity({
    required String courseId,
  });

  Future<void> upsertEntity({
    required CourseEntity entity,
  });

  Stream<List<CourseEntity>> observeEntities({
    required bool completed,
  });

  Future<List<String>> getCourseIds({
    required bool completed,
  });

  Stream<CourseEntity?> observeEntity({
    required String id,
  });

  Future<void> deleteEntity({
    required String courseId,
  });

  Future<void> deleteEntities({
    required List<String> courseIds,
  });

  Future<void> deleteAllEntities();

  Future<void> deleteEntitiesByStatus({
    required bool completed,
  });
}
