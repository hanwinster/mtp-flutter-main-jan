import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class BlogPostCommentRepository {
  Stream<Result<List<BlogPostComment>>> observeComments({
    required String postId,
  });

  Future<CreateBlogPostCommentResult> createComment({
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  });

  Future<UpdateBlogPostCommentResult> updateComment({
    required String commentId,
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  });

  Future<void> deleteComment({
    required String postId,
    required String commentId,
  });

  Future<void> createReaction({
    required String commentId,
    required ReactionType reactionType,
  });

  Future<void> updateReaction({
    required String commentId,
    required String reactionId,
    required ReactionType reactionType,
  });

  Future<void> deleteReaction({
    required String commentId,
    required String reactionId,
  });
}
