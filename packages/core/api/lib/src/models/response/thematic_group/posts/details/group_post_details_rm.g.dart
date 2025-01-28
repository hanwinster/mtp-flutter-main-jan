// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_post_details_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupPostDetailsRM _$GroupPostDetailsRMFromJson(Map<String, dynamic> json) =>
    GroupPostDetailsRM(
      data: json['data'] == null
          ? null
          : GroupPostDetailsDataRM.fromJson(
              json['data'] as Map<String, dynamic>),
    );

GroupPostDetailsDataRM _$GroupPostDetailsDataRMFromJson(
        Map<String, dynamic> json) =>
    GroupPostDetailsDataRM(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tgroupId: (json['tgroup_id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      youtubeLink: json['youtube_link'] as String?,
      taggedUsers: json['tagged_users'] as String?,
      shares: (json['shares'] as num?)?.toInt(),
      viewCount: (json['view_count'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      approvedBy: json['approved_by'] as String?,
      deactivatedBy: json['deactivated_by'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      username: json['username'] as String?,
      userAvatar: json['user_avatar'] as String?,
      isOwner: json['is_owner'] as bool?,
      myReaction: json['my_reaction'] as String?,
      taggedUserInfo: json['tagged_user_info'] as String?,
      numberOfReactions: (json['number_of_reactions'] as num?)?.toInt(),
      numberOfComments: (json['number_of_comments'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      uploadedVideoUrl: json['uploaded_video_url'] as String?,
      coverImages: json['cover_images'] == null
          ? null
          : ImageUrlRM.fromJson(json['cover_images'] as Map<String, dynamic>),
      videoFile: json['video_file'] as String?,
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
    );

ThematicGroupPostDetailsCommentsRM _$ThematicGroupPostDetailsCommentsRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupPostDetailsCommentsRM(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      postId: (json['post_id'] as num?)?.toInt(),
      commentType: json['comment_type'] as String?,
      replyId: (json['reply_id'] as num?)?.toInt(),
      description: json['description'] as String?,
      active: (json['active'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      myReaction: json['my_reaction'] as String?,
      numberOfReactions: (json['number_of_reactions'] as num?)?.toInt(),
      username: json['username'] as String?,
      userAvatar: json['user_avatar'] as String?,
      imageUrl: json['image_url'] as String?,
      videoUrl: json['video_file'] as String?,
      images: json['images'] == null
          ? null
          : ImageUrlRM.fromJson(json['images'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
    );
