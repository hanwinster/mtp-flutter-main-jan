import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';
import 'package:drift_database/src/mappers/mappers.dart';
import 'package:rxdart/rxdart.dart';

import '../../tables/tables.dart';

part 'drift_blog_post_dao.g.dart';

@DriftAccessor(tables: [
  BlogPostTable,
  BlogPostQueryTable,
])
class DriftBlogPostDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftBlogPostDaoMixin
    implements BlogPostDao {
  DriftBlogPostDao(super.db);

  @override
  Stream<List<BlogPostEntity>> observeEntities({
    required String query,
  }) {
    final blogPostQuery = select(blogPostQueryTable)
      ..where((tbl) => tbl.query.equals(query));
    final blogPostQueryStream = blogPostQuery.watchSingleOrNull();
    return blogPostQueryStream.switchMap((blogPostQuery) {
      if (blogPostQuery == null) {
        return Stream.value([]);
      }
      return (select(blogPostTable)
            ..where((tbl) => tbl.id.isIn(blogPostQuery.ids))
            ..orderBy([
              (tbl) => OrderingTerm(
                  expression: tbl.createdAt, mode: OrderingMode.desc),
            ]))
          .watch()
          .map((entries) => entries.map((entry) => entry.toEntity()).toList());
    });
  }

  @override
  Stream<BlogPostEntity> observeEntity({required String entityId}) {
    return (select(blogPostTable)..where((tbl) => tbl.id.equals(entityId)))
        .watchSingle()
        .map((entry) => entry.toEntity());
  }

  @override
  Future<BlogPostEntity> getEntity({required String entityId}) async {
    final query = select(blogPostTable)
      ..where((tbl) => tbl.id.equals(entityId));
    final entry = await query.getSingle();
    return entry.toEntity();
  }

  @override
  Future<void> upsertEntities({
    required String query,
    required List<BlogPostEntity> entities,
  }) async {
    final blogPostQuery = BlogPostQueryTableCompanion(
      query: Value(query),
      ids: Value(entities.map((entity) => entity.id).toList()),
    );
    await into(blogPostQueryTable).insertOnConflictUpdate(blogPostQuery);
    await batch(
      (batch) {
        batch.insertAllOnConflictUpdate(
          blogPostTable,
          entities.map((e) => e.toEntry()).toList(),
        );
      },
    );
  }

  @override
  Future<void> upsertEntity({
    required BlogPostEntity entity,
  }) async {
    await into(blogPostTable).insertOnConflictUpdate(entity.toCompanion());
  }

  @override
  Future<void> deleteEntities({required List<String> ids}) async {
    await (delete(blogPostTable)..where((tbl) => tbl.id.isIn(ids))).go();
  }

  @override
  Future<void> deleteEntitiesByQuery({
    required String query,
  }) async {
    // we delete only the query because
    // the blog post can be included in other queries
    await (delete(blogPostQueryTable)..where((tbl) => tbl.query.equals(query)))
        .go();
  }

  @override
  Future<void> incrementShareCount({
    required String postId,
  }) async {
    await customUpdate(
      'UPDATE blog_posts SET share_count = share_count + 1 WHERE id = ?',
      variables: [Variable.withString(postId)],
      updates: {blogPostTable},
    );
  }

  @override
  Future<void> incrementCommentCount({
    required String postId,
  }) async {
    await customUpdate(
      'UPDATE blog_posts SET number_of_comments = number_of_comments + 1 WHERE id = ?',
      variables: [Variable.withString(postId)],
      updates: {blogPostTable},
    );
  }

  @override
  Future<void> decrementCommentCount({
    required String postId,
  }) async {
    await customUpdate(
      'UPDATE blog_posts SET number_of_comments = number_of_comments - 1 WHERE id = ?',
      variables: [Variable.withString(postId)],
      updates: {blogPostTable},
    );
  }
}
