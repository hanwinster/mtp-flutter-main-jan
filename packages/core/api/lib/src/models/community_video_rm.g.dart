// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_video_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityVideoRM _$CommunityVideoRMFromJson(Map<String, dynamic> json) =>
    CommunityVideoRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      isYoutubeVideo: (json['is_youtube_video'] as num?)?.toInt(),
      videoUrl: json['video_url'] as String?,
      isPublished: (json['is_published'] as num?)?.toInt(),
      viewCount: (json['view_count'] as num?)?.toInt(),
      shareCount: (json['share_count'] as num?)?.toInt(),
      type: json['type'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      image: json['image'] as String?,
      videoFile: json['video_file'] as String?,
      videoLink: json['video_link'] as String?,
      createdTimeAgo: json['created_time_ago'] as String?,
      updatedTimeAgo: json['updated_time_ago'] as String?,
    );
