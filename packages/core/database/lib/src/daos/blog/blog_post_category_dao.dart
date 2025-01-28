import 'package:database/database.dart';

abstract class BlogPostCategoryDao {
  Stream<List<BlogPostCategoryEntity>> observeEntities();

  Future<void> upsertEntities({
    required List<BlogPostCategoryEntity> entities,
  });

  Future<void> deleteAllEntities();
}
