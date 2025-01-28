import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class BlogPostRepository {
  Stream<Result<List<BlogPost>>> observeLatestBlogPosts();

  Stream<Result<List<BlogPost>>> observeRecommendedBlogPosts();

  Stream<Result<List<BlogPost>>> observeBlogPosts({
    required String categoryId,
    required String keyword,
  });

  Stream<Result<List<BlogPost>>> observeBlogPostsByTag({
    required String tagId,
  });

  Stream<Result<BlogPost>> observeBlogPostById({
    required String postId,
  });

  Future<void> createReaction({
    required String postId,
    required ReactionType reactionType,
  });

  Future<void> updateReaction({
    required String postId,
    required String reactionId,
    required ReactionType reactionType,
  });

  Future<void> deleteReaction({
    required String postId,
    required String reactionId,
  });

  Future<void> markAsRead({
    required String postId,
  });
}
