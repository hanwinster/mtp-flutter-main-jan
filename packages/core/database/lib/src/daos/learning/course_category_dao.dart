import 'package:database/database.dart';

abstract class CourseCategoryDao {
  Stream<List<CourseCategoryEntity>> observeEntities();

  Future<void> upsertEntities({
    required List<CourseCategoryEntity> entities,
  });

  Future<void> deleteAllEntities();
}
