import 'package:database/database.dart';

abstract class BlogPostCommentDao {
  Stream<List<BlogPostCommentEntity>> observeEntities({
    required String postId,
  });

  Future<BlogPostCommentEntity> getEntity({
    required String entityId,
  });

  Future<void> upsertEntities({required List<BlogPostCommentEntity> entities});

  Future<void> upsertEntity({required BlogPostCommentEntity entity});

  Future<void> deleteEntities({
    required List<String> ids,
  });
  Future<void> deleteEntity({
    required String id,
  });


  Future<void> deleteEntitiesByPostId({
    required String postId,
  });
}
