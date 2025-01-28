// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_post_create_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupPostCreateResponseRM _$ThematicGroupPostCreateResponseRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupPostCreateResponseRM(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tgroupId: (json['tgroup_id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      youtubeLink: json['youtube_link'] as String?,
      taggedUsers: (json['tagged_users'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      shares: (json['shares'] as num?)?.toInt(),
      viewCount: (json['view_count'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      username: json['username'] as String?,
      userAvatar: json['user_avatar'] as String?,
      isOwner: json['is_owner'] as bool?,
      myReaction: json['my_reaction'] as String?,
      coverImages: json['cover_images'] == null
          ? null
          : ImageUrlRM.fromJson(json['cover_images'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
    );
