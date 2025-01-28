import 'dart:io';

import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class ThematicGroupRepository {
  Future<List<ThematicGroupListing>> getUserGroups({
    required int page,
    required int pageSize,
    required String keyword,
    required List<String> categories,
  });

  Future<List<ThematicGroupListing>> getRecommendGroups({
    required int page,
    required int pageSize,
    required String keyword,
    required List<String> categories,
  });

  Future<ThematicGroupListing> getGroup({
    required String groupId,
  });

  Stream<Result<List<ThematicGroupPost>>> observeGroupPost({
    required int page,
    int? pageSize,
    required String group_id,
  });

  Future<ThematicGroupPostCreateResponse> createPost({
    required String groupId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });

  Future<void> editPost({
    required String post_id,
    required String group_id,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  });


  Future<ThematicGroupRulesResponse> getGroupRules();

  Future<List<ThematicGroupCategory>> getCategories();

  Future<Reaction> createReaction({
    required ThematicGroupReactionToType reactionToType,
    required ReactionType reaction,
    required String reactionToId,
    required String groupId,
  });

  Future<Reaction> updateReaction({
    required String reactionId,
    required ReactionType reaction,
  });

  Future<void> deleteReaction({
    required String reactionId,
  });

  Future<Result<ThematicGroupPostCreateResponse>> deletePost({
    required String postId,
  });

  Future<ThematicGroupRequestResponse> requestJoinGroup({
    required String groupId,
    required bool isApproved,
  });

  Future<String> leaveGroup({
    required String groupId,
  });
}
