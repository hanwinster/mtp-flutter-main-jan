import 'dart:io';

import 'package:api/api.dart';

abstract class BlogApi {

  Future<List<BlogPostRM>> getLatestBlogPosts();

  Future<List<BlogPostRM>> getRecommendedBlogPosts();

  Future<List<BlogPostRM>> searchBlogPosts({
    String? keyword,
    int? categoryId,
    int? tagId,
  });

  Future<List<BlogPostCategoryRM>> getBlogPostCategories();

  Future<BlogPostRM> getBlogPost({
    required int postId,
  });

  Future<List<BlogPostCommentRM>> getBlogPostComments({
    required int postId,
  });

  Future<BlogPostCommentRM> createBlogPostComment({
    required int postId,
    required String text,
    File? image,
    File? video,
  });

  Future<BlogPostCommentRM> updateBlogPostComment({
    required int commentId,
    required int postId,
    required String text,
    File? image,
    File? video,
  });

  Future<void> deleteBlogPostComment({
    required int commentId,
  });

  Future<ReactionRM> createBlogPostReaction({
    required int postId,
    required String reaction,
  });

  Future<ReactionRM> updateBlogPostReaction({
    required int postId,
    required int reactionId,
    required String reaction,
  });

  Future<dynamic> deleteBlogPostReaction({
    required int postId,
    required int reactionId,
  });

  Future<ReactionRM> createBlogPostCommentReaction({
    required int commentId,
    required String reaction,
  });

  Future<ReactionRM> updateBlogPostCommentReaction({
    required int commentId,
    required int reactionId,
    required String reaction,
  });

  Future<dynamic> deleteBlogPostCommentReaction({
    required int commentId,
    required int reactionId,
  });

  Future<List<BlogPostQuizQuestionRM>> getBlogPostQuizQuestions({
    required String postId,
  });

  Future<void> saveBlogPostQuizUserAnswers({
    required String postId,
    required String questionId,
    required Map<String, dynamic> answers,
  });

  Future<void> updateBlogPostQuizUserAnswers({
    required String postId,
    required String questionId,
    required Map<String, dynamic> answers,
  });

  Future<BlogPostQuizUserAnswerResultRM> submitBlogPostQuizUserAnswer({
    required String postId,
  });

  Future<void> markBlogPostAsRead({
    required String postId,
  });

  Future<void> trackBlogView({
    required String postId,
  });

  Future<void> trackBlogShare({
    required String postId,
  });
}
