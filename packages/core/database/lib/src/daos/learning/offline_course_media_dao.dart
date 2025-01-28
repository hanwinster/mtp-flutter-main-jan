import 'package:database/database.dart';

abstract class OfflineCourseMediaDao {
  Future<void> upsertEntity({
    required OfflineCourseMediaEntity entity,
  });

  Stream<List<OfflineCourseMediaEntity>> observeEntities();

  Future<void> deleteEntity({
    required String id,
  });
}
