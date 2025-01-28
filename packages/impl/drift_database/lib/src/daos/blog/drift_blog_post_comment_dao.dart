import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';
import 'package:drift_database/src/mappers/mappers.dart';

import '../../tables/tables.dart';

part 'drift_blog_post_comment_dao.g.dart';

@DriftAccessor(tables: [BlogPostCommentTable])
class DriftBlogPostCommentDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftBlogPostCommentDaoMixin
    implements BlogPostCommentDao {
  DriftBlogPostCommentDao(super.db);

  @override
  Future<void> deleteEntity({required String id}) async {
    await (delete(blogPostCommentTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> deleteEntities({
    required List<String> ids,
  }) async {
    await (delete(blogPostCommentTable)..where((tbl) => tbl.id.isIn(ids))).go();
  }

  @override
  Future<void> deleteEntitiesByPostId({
    required String postId,
  }) async {
    await (delete(blogPostCommentTable)
          ..where((tbl) => tbl.postId.equals(postId)))
        .go();
  }

  @override
  Stream<List<BlogPostCommentEntity>> observeEntities({
    required String postId,
  }) {
    final query = select(blogPostCommentTable)
      ..where((tbl) => tbl.postId.equals(postId))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
      ]);
    return query
        .watch()
        .map((rows) => rows.map((row) => row.toEntity()).toList());
  }

  @override
  Future<void> upsertEntities({
    required List<BlogPostCommentEntity> entities,
  }) async {
    await batch(
      (batch) => batch.insertAllOnConflictUpdate(
          blogPostCommentTable, entities.map((e) => e.toCompanion()).toList()),
    );
  }

  @override
  Future<void> upsertEntity({
    required BlogPostCommentEntity entity,
  }) async {
    await into(blogPostCommentTable)
        .insertOnConflictUpdate(entity.toCompanion());
  }

  @override
  Future<BlogPostCommentEntity> getEntity({
    required String entityId,
  }) async {
    final query = select(blogPostCommentTable)
      ..where((tbl) => tbl.id.equals(entityId));
    final entry = await query.getSingle();
    return entry.toEntity();
  }
}
