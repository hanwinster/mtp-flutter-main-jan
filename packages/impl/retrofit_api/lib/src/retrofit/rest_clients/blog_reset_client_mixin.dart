import 'dart:io';

import 'package:api/api.dart';
import 'package:retrofit/http.dart';

mixin BlogRestClientMixin {
  static List<String> quizIncludes = [
    'blogSurveyCurrentUsers',
  ];

  @GET('/blog-categories')
  Future<ApiDataResponse<List<BlogPostCategoryRM>>> getBlogPostCategories();

  @GET('/blogs')
  Future<ApiDataResponse<List<BlogPostRM>>> getLatestBlogPosts({
    @Query('sort[0][field]') String sortField = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
    @Query('published') int published = 1,
    @Query('limit') int limit = 99999,
    @Query('include') String? include = 'user',
  });

  @GET('/blogs')
  Future<ApiDataResponse<List<BlogPostRM>>> getRecommendedBlogPosts({
    @Query('sort[0][field]') String sortField = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
    @Query('published') int published = 1,
    @Query('include') String? include = 'user,categories,tags',
    @Query('limit') int limit = 999999,
  });

  @GET('/blogs')
  Future<ApiDataResponse<List<BlogPostRM>>> searchBlogPosts({
    @Query('search[value]=') String? query,
    @Query('categories') String? commaSeparatedCategoryIds,
    @Query('tags') String? commaSeparatedTagIds,
    @Query('published') int published = 1,
    @Query('include') String? include = 'user,categories,tags',
    @Query('limit') int limit = 999999,
    @Query('sort[0][field]') String sortField = 'created_at',
    @Query('sort[0][direction]') String sortDirection = 'desc',
  });

  @GET('/blogs/{post_id}')
  Future<ApiDataResponse<BlogPostRM>> getBlogPostDetails({
    @Path('post_id') required int postId,
    @Query('include') String? include = 'user,categories,tags',
  });

  @GET('/blogs/{post_id}/comments')
  Future<ApiDataResponse<List<BlogPostCommentRM>>> getBlogPostComments({
    @Path('post_id') required int postId,
  });

  @POST('/blog-comments')
  @MultiPart()
  Future<ApiDataResponse<BlogPostCommentRM>> postBlogPostComment({
    @Part(name: 'blog_id') required int postId,
    @Part(name: 'description') required String text,
    @Part(name: 'active') int active = 1,
    @Part(name: 'comment_img') File? image,
    @Part(name: 'uploaded_video') File? video,
  });

  @PUT('/blog-comments/{comment_id}')
  @MultiPart()
  Future<ApiDataResponse<BlogPostCommentRM>> putBlogPostComment({
    @Path('comment_id') required int commentId,
    @Part(name: 'blog_id') required int postId,
    @Part(name: 'description') required String text,
    @Part(name: 'active') int active = 1,
  });

  @DELETE('/blog-comments/{comment_id}')
  Future<void> deleteBlogPostComment({
    @Path('comment_id') required int commentId,
  });

  @POST('/blog-reactions')
  Future<ApiDataResponse<ReactionRM>> createBlogPostReaction({
    @Field('reaction_to_id') required int postId,
    @Field('reaction_type') required String reaction,
    @Field('reaction_to_type') String reactionTo = 'post',
    @Field('active') int active = 1,
  });

  @PUT('/blog-reactions/{reaction_id}')
  Future<ApiDataResponse<ReactionRM>> updateBlogPostReaction({
    @Path('reaction_id') required int reactionId,
    @Field('reaction_type') required String reaction,
    @Field('reaction_to_id') required int postId,
    @Field('reaction_to_type') String reactionTo = 'post',
    @Field('active') int active = 1,
  });

  @DELETE('/blog-reactions/{reaction_id}')
  Future<dynamic> deleteBlogPostReaction({
    @Path('reaction_id') required int reactionId,
  });

  @POST('/blog-reactions')
  Future<ApiDataResponse<ReactionRM>> createBlogPostCommentReaction({
    @Field('reaction_to_id') required int commentId,
    @Field('reaction_type') required String reaction,
    @Field('reaction_to_type') String reactionTo = 'comment',
    @Field('active') int active = 1,
  });

  @PUT('/blog-reactions/{reaction_id}')
  Future<ApiDataResponse<ReactionRM>> updateBlogPostCommentReaction({
    @Path('reaction_id') required int reactionId,
    @Field('reaction_to_id') required int commentId,
    @Field('reaction_type') required String reaction,
    @Field('reaction_to_type') String reactionTo = 'comment',
    @Field('active') int active = 1,
  });

  @DELETE('/blog-reactions/{reaction_id}')
  Future<dynamic> deleteBlogPostCommentReaction({
    @Path('reaction_id') required int reactionId,
  });

  @GET('/blog-posts/{post_id}/get-surveys')
  Future<ApiDataResponse<List<BlogPostQuizQuestionRM>>>
      getBlogPostQuizQuestions({
    @Path('post_id') required String postId,
    @Query('include') required List<String> includes,
  });

  @POST('/blog-posts/{post_id}/assessments/{question_id}/save')
  @FormUrlEncoded()
  Future<dynamic> saveBlogPostQuizUserAnswers({
    @Path('post_id') required int postId,
    @Path('question_id') required int questionId,
    @Body() required Map<String, dynamic> answers,
  });

  @PUT('/blog-posts/{postId}/assessments/{questionId}/update')
  @FormUrlEncoded()
  Future<dynamic> updateBlogPostQuizUserAnswers({
    @Path('postId') required int postId,
    @Path('questionId') required int questionId,
    @Body() required Map<String, dynamic> answers,
  });

  @POST('/blog-posts/{post_id}/assessments/submit')
  Future<ApiDataResponse<BlogPostQuizUserAnswerResultRM>>
      submitBlogPostQuizUserAnswer({
    @Path('post_id') required int postId,
  });

  @POST('/blog-posts/{post_id}/mark-as-read')
  Future<BlogPostQuizUserAnswerResultRM> markBlogPostAsRead({
    @Path('post_id') required int postId,
  });

  @PUT('/blogs/count/{post_id}')
  Future<void> trackBlogView({
    @Path('post_id') required int postId,
  });

  @PUT('/blogs/share/{post_id}')
  Future<void> trackBlogShare({
    @Path('post_id') required int postId,
  });
}
