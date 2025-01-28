import 'package:database/database.dart';

abstract class BlogPostDao {
  Stream<List<BlogPostEntity>> observeEntities({
    required String query,
  });

  Future<BlogPostEntity> getEntity({
    required String entityId,
  });

  Stream<BlogPostEntity> observeEntity({
    required String entityId,
  });

  Future<void> upsertEntities({
    required String query,
    required List<BlogPostEntity> entities,
  });

  Future<void> upsertEntity({
    required BlogPostEntity entity,
  });

  Future<void> deleteEntities({
    required List<String> ids,
  });

  Future<void> deleteEntitiesByQuery({
    required String query,
  });

  Future<void> incrementShareCount({
    required String postId,
  });

  Future<void> incrementCommentCount({
    required String postId,
  });

  Future<void> decrementCommentCount({
    required String postId,
  });
}
