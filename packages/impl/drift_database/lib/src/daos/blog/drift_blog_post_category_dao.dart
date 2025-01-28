import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_blog_post_category_dao.g.dart';

@DriftAccessor(tables: [
  BlogPostCategoryTable,
])
class DriftBlogPostCategoryDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftBlogPostCategoryDaoMixin
    implements BlogPostCategoryDao {
  DriftBlogPostCategoryDao(super.db);

  @override
  Stream<List<BlogPostCategoryEntity>> observeEntities() {
    return select(blogPostCategoryTable).watch().map((entries) {
      return entries.map((entry) => entry.toEntity()).toList();
    });
  }

  @override
  Future<void> upsertEntities({
    required List<BlogPostCategoryEntity> entities,
  }) async {
    await batch(
      (batch) {
        batch.insertAllOnConflictUpdate(
          blogPostCategoryTable,
          entities.map((e) => e.toCompanion()).toList(),
        );
      },
    );
  }

  @override
  Future<void> deleteAllEntities() async {
    await delete(blogPostCategoryTable).go();
  }
}
