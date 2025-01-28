// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_post_comment_reply_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupPostCommentReplyRM _$ThematicGroupPostCommentReplyRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupPostCommentReplyRM(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      commentId: (json['comment_id'] as num?)?.toInt(),
      commentType: json['comment_type'] as String?,
      replyId: (json['reply_id'] as num?)?.toInt(),
      description: json['description'] as String?,
      active: (json['active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userReaction: json['user_reaction'] == null
          ? null
          : ReactionRM.fromJson(json['user_reaction'] as Map<String, dynamic>),
      numberOfReactions: (json['number_of_reactions'] as num?)?.toInt(),
      username: json['username'] as String?,
      userAvatar: json['user_avatar'] as String?,
      imageUrl: json['image_url'] as String?,
      replyTo: json['reply_to'] == null
          ? null
          : ThematicGroupPostCommentUserRM.fromJson(
              json['reply_to'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : ImageUrlRM.fromJson(json['images'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
    );
