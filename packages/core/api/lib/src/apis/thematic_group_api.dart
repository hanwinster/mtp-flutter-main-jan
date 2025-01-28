import 'dart:io';

import 'package:api/api.dart';

abstract class ThematicGroupApi {

  Future<List<ThematicGroupListingRM>> getRecommendedGroups({
    required int page,
    required int pageSize,
    String? keyword,
    String? categories,
  });

  Future<List<ThematicGroupListingRM>> getUserGroups({
    required int page,
    required int pageSize,
    String? keyword,
    String? categories,
  });

  Future<ThematicGroupListingRM> getGroup({
    required String groupId,
  });

  Future<ThematicGroupRulesResponseRM> getGroupRules();

  Future<ThematicGroupRequestResponseRM> requestToJoinGroup({
    required String group_id,
    required String user_id,
    int? approval_status,
  });

  Future<List<ThematicGroupPostRM>> getPostsList({
    int? page,
    int? pageSize,
    required String group_id,
  });

  Future<ThematicGroupPostCreateResponseRM> createPost({
    required String group_id,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });

  Future<ThematicGroupPostCreateResponseRM> editPost({
    required String post_id,
    required String group_id,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });

  Future<List<ThematicGroupPostCommentRM>> getThematicGroupPostComments({
    required String post_id,
    required int page,
    required int pasgeSize,
  });

  Future<void> deleteThematicGroupPostComment({
    required String commentId,
  });

  Future<void> deleteThematicGroupPostReply({
    required String replyId,
  });

  Future<ReactionRM> createThematicGroupReaction({
    required ReactionTypeRM reactionType,
    required String reactionToType,
    required int reactionToId,
    required int groupId,
  });

  Future<ReactionRM> updateThematicGroupReaction({
    required int reactionId,
    required ReactionTypeRM reactionType,
  });

  Future<void> deleteThematicGroupReaction({
    required int reactionId,
  });

  Future<List<ThematicGroupCategoryRM>> getCategories();

  Future<GroupPostDetailsDataRM> getPostDetails({
    required String postId,
    required String includes,
  });

  Future<ThematicGroupPostCommentRM> createThematicGroupPostComment({
    required int postId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });

  Future<ThematicGroupPostCommentRM> updateThematicGroupPostComment({
    required int commentId,
    required int postId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });

  Future<ThematicGroupPostCommentReplyRM> createThematicGroupPostPostReply({
    required int commentId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });

  Future<ThematicGroupPostCommentReplyRM> updateThematicGroupPostPostReply({
    required int replyId,
    required int commentId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });

  Future<ThematicGroupPostCreateResponseRM> deleteGroupPost({
    required int postId,
  });

  Future<String> leaveGroup({
    required int groupId,
  });

  Future<ApiPaginatedResponse<ThematicGroupPostRM>> getGroupApprovedPosts({
    required int groupId,
    required int userId,
    required int page,
    required int limit,
  });

  Future<List<ThematicGroupPostRM>> getGroupPendingPosts({
    required int groupId,
    required int userId,
    required int page,
    required int limit,
  });

  Future<ThematicGroupPostRM> getGroupPost({
    required int postId,
  });
}