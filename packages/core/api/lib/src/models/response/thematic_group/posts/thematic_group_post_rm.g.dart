// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_post_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupPostRM _$ThematicGroupPostRMFromJson(Map<String, dynamic> json) =>
    ThematicGroupPostRM(
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
      approvedBy: json['approved_by'],
      deactivatedBy: json['deactivated_by'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
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
      userReaction: json['user_reaction'] == null
          ? null
          : UserReactionRm.fromJson(
              json['user_reaction'] as Map<String, dynamic>),
    );
