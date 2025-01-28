import 'dart:io';

import 'package:api/api.dart';
import 'package:retrofit/http.dart';

mixin ThematicGroupRestClientMixin {
  static List<String> groupsIncludes = [
    'categories',
  ];

  @GET('/thematic-groups')
  Future<ApiPaginatedResponse<ThematicGroupListingRM>> getUserGroups({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('self') int self = 1,
    @Query('search[value]') required String? keyword,
    @Query('group_categories') required String? categories,
    @Query('include') required String include,
    @Query('sort[0][field]') String sortField = 'created_at',
    @Query('sort[0][direction]') String sortDirection = 'desc',
  });

  @GET('/thematic-groups')
  Future<ApiPaginatedResponse<ThematicGroupListingRM>> getRecommendGroups({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('self') int self = -1,
    @Query('search[value]') required String? keyword,
    @Query('group_categories') required String? categories,
    @Query('include') required String include,
    @Query('sort[0][field]') String sortField = 'created_at',
    @Query('sort[0][direction]') String sortDirection = 'desc',
  });

  @GET('/thematic-groups/{group_id}')
  Future<ApiDataResponse<ThematicGroupListingRM>> getGroup({
    @Path('group_id') required String groupId,
    @Query('include') required String include,
  });

  @POST('/thematic-group-requests')
  Future<ApiDataResponse<ThematicGroupRequestResponseRM>> requestToJoinGroup({
    @Field('tgroup_id') required String tgroup_id,
    @Field('user_id') required String user_id,
    @Field('approval_status') required int approval_status,
  });

  @GET('/thematic-group-posts')
  Future<ApiDataResponse<List<ThematicGroupPostRM>>> getPostsList({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('tgroup_id') required String group_id,
    @Query('active') required int active,
    @Query('sort[0][field]') String sort = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @GET('/thematic-group-posts/{post_id}')
  Future<ApiDataResponse<ThematicGroupPostRM>> getGroupPost({
   @Path('post_id') required int postId,
  });

  @POST('/thematic-group-posts')
  Future<ApiDataResponse<ThematicGroupPostCreateResponseRM>> createPost({
    @Part(name: 'description') required String description,
    @Part(name: 'tgroup_id') required String tgroupId,
    @Part(name: 'tgroup_post_uploaded_file') File? uploadedFile,
    @Part(name: 'tgroup_post_uploaded_video') File? uploadedVideo,
  });

  @MultiPart()   
  @POST('/thematic-group-posts/{id}')
  Future<ApiDataResponse<ThematicGroupPostCreateResponseRM>> EditPost({
    @Path("id") required String postId,
    @Part(name: 'description') required String description,
    @Part(name: 'tgroup_id') required String tgroupId,
    @Part(name: 'tgroup_post_uploaded_file') File? uploadedFile,
    @Part(name: 'tgroup_post_uploaded_video') File? uploadedVideo,
    @Part(name: '_method') String method = "put",  // Changed from @Field to @Part
  });

  @GET('/thematic-group-post-comments')
  Future<ApiDataResponse<List<ThematicGroupPostCommentRM>>> getCommentsList({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('tgroup_post_id') required String post_id,
    @Query('sort[0][field]') String sort = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @DELETE('/thematic-group-post-comments/{comment_id}')
  Future<dynamic> deleteComment({
    @Path('comment_id') required int commentId,
  });

  @DELETE('/thematic-group-post-comment-replies/{reply_id}')
  Future<dynamic> deleteReply({
    @Path('reply_id') required int replyId,
  });

  @GET('/get-group-rules')
  Future<ThematicGroupRulesResponseRM> getGroupRules();

  @GET('/thematic-group-categories')
  Future<ApiDataResponse<List<ThematicGroupCategoryRM>>> getCategories();

  @POST('/thematic-group-reactions')
  Future<ApiDataResponse<ReactionRM>> createThematicGroupReaction({
    @Field('tgroup_id') required String groupId,
    @Field('reaction_type') required String reactionType,
    @Field('reaction_to_type') required String reactionToType,
    @Field('reaction_to_id') required String reactionToId,
  });

  @PUT('/thematic-group-reactions/{reaction_id}')
  Future<ApiDataResponse<ReactionRM>> updateThematicGroupReaction({
    @Path('reaction_id') required int reactionId,
    @Field('reaction_type') required String reactionType,
  });

  @DELETE('/thematic-group-reactions/{reaction_id}')
  Future<dynamic> deleteThematicGroupReaction({
    @Path('reaction_id') required int reactionId,
  });

  @POST('/thematic-group-post-comments')
  Future<ApiDataResponse<ThematicGroupPostCommentRM>> createPostComment({
    @Part(name: 'description') required String description,
    @Part(name: 'tgroup_post_id') required String tgroup_post_id,
    @Part(name: 'tgroup_post_comment_img') File? uploadedImage,
    @Part(name: 'tgroup_post_comment_video') File? uploadedVideo,
  });

  @POST('/thematic-group-post-comments/{comment_id}')
  Future<ApiDataResponse<ThematicGroupPostCommentRM>> updatePostComment({
    @Path('comment_id') required int commentId,
    @Part(name: 'description') required String description,
    @Part(name: '_method') String method = "put",
  });

  @POST('/thematic-group-post-comment-replies')
  Future<ApiDataResponse<ThematicGroupPostCommentReplyRM>> createThematicGroupPostReply({
    @Part(name: 'description') required String description,
    @Part(name: 'comment_type') String comment_type = 'comment',
    @Part(name: 'comment_id') required String comment_id,
    @Part(name: 'reply_id') required String reply_id,
    @Part(name: 'tgroup_post_com_reply_img') File? uploadedImage,
    @Part(name: 'tgroup_post_com_reply_video') File? uploadedVideo,
  });

  @POST('/thematic-group-post-comment-replies/{reply_id}')
  Future<ApiDataResponse<ThematicGroupPostCommentReplyRM>> updateThematicGroupPostReply({
    @Path('reply_id') required int replyId,
    @Part(name: 'description') required String description,
    @Part(name: '_method') String method = "put",
  });

  @DELETE('/thematic-group-posts/{postId}')
  Future<ApiDataResponse<ThematicGroupPostCreateResponseRM>> deleteGroupPost({
    @Path('postId') required int postId,
  });

  @POST('/thematic-groups/{groupId}/leave-group')
  Future<ApiDataResponse<String>> leaveGroup({
    @Path('groupId') required int groupId,
    @Field('leave_option') required String leaveOption,
  });

  // thematic-group-posts/125?
  @GET('/thematic-group-posts/{postId}')
  Future<ApiDataResponse<GroupPostDetailsDataRM>> getPostDetails({
    @Path('postId') required String postId,
    @Query('include') required String include,
  });

  @GET('/thematic-group-posts')
  Future<ApiPaginatedResponse<ThematicGroupPostRM>> getGroupApprovedPosts({
    @Query('tgroup_id') required int groupId,
    @Query('user_id') required int userId,
    @Query('active') int active = 1,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

  @GET('/thematic-group-posts')
  Future<ApiDataResponse<List<ThematicGroupPostRM>>> getGroupPendingPosts({
    @Query('tgroup_id') required int groupId,
    @Query('user_id') required int userId,
    @Query('active') int active = 0,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });
}
