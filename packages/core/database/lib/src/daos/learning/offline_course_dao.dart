import 'package:database/database.dart';

abstract class OfflineCourseDao {
  Future<void> upsertEntity({
    required OfflineCourseEntity entity,
  });

  Stream<List<OfflineCourseEntity>> observeEntities();

  Future<void> deleteEntity({
    required String courseId,
  });
}
