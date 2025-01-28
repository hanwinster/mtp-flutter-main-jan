// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_post_comment_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupPostCommentRM _$ThematicGroupPostCommentRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupPostCommentRM(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      postId: (json['tgroup_post_id'] as num?)?.toInt(),
      description: json['description'] as String?,
      active: (json['active'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      username: json['username'] as String?,
      userAvatar: json['user_avatar'] as String?,
      imageUrl: json['image_url'] as String?,
      uploadedVideoUrl: json['uploaded_video_url'] as String?,
      replyCount: (json['reply_count'] as num?)?.toInt(),
      userReaction: json['user_reaction'] == null
          ? null
          : ReactionRM.fromJson(json['user_reaction'] as Map<String, dynamic>),
      numberOfReactions: (json['number_of_reactions'] as num?)?.toInt(),
      images: json['images'] == null
          ? null
          : ImageUrlRM.fromJson(json['images'] as Map<String, dynamic>),
      videoFile: json['video_file'] as String?,
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
      commentReplies: (json['comment_replies'] as List<dynamic>?)
          ?.map((e) => ThematicGroupPostCommentReplyRM.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      commentReactions: (json['comment_reactions'] as List<dynamic>?)
          ?.map((e) =>
              ThematicGroupPostReactionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
