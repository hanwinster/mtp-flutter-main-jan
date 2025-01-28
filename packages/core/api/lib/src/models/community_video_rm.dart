import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_video_rm.g.dart';

@JsonSerializable(createToJson: false)
class CommunityVideoRM extends Equatable {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'is_youtube_video')
  final int? isYoutubeVideo;

  @JsonKey(name: 'video_url')
  final String? videoUrl;

  @JsonKey(name: 'is_published')
  final int? isPublished;

  @JsonKey(name: 'view_count')
  final int? viewCount;

  @JsonKey(name: 'share_count')
  final int? shareCount;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'image')
  final String? image;

  @JsonKey(name: 'video_file')
  final String? videoFile;

  @JsonKey(name: 'video_link')
  final String? videoLink;

  @JsonKey(name: 'created_time_ago')
  final String? createdTimeAgo;

  @JsonKey(name: 'updated_time_ago')
  final String? updatedTimeAgo;

  const CommunityVideoRM({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.isYoutubeVideo,
    required this.videoUrl,
    required this.isPublished,
    required this.viewCount,
    required this.shareCount,
    required this.type,
    required this.userId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.videoFile,
    required this.videoLink,
    required this.createdTimeAgo,
    required this.updatedTimeAgo,
  });

  factory CommunityVideoRM.fromJson(Map<String, dynamic> json) =>
      _$CommunityVideoRMFromJson(json);

  CommunityVideoModel toDomainModel() {
    return CommunityVideoModel(
      id: id ?? (throw Exception('Community Video id is null')),
      title: title ?? '',
      slug: slug ?? '',
      description: description ?? '',
      isYoutubeVideo: isYoutubeVideo ?? 0,
      videoUrl: videoUrl ?? '',
      isPublished: isPublished ?? 0,
      viewCount: viewCount ?? 0,
      shareCount: shareCount ?? 0,
      type: type ?? '',
      userId: userId ?? 0,
      deletedAt: deletedAt ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      image: image ?? '',
      videoFile: videoFile ?? '',
    videoLink: videoLink ?? '',
      createdTimeAgo: createdTimeAgo ?? '',
      updatedTimeAgo: updatedTimeAgo ?? '',
    );
  }

  @override
  List<Object?> get props =>
      [
        id,
        title,
        slug,
        description,
        isYoutubeVideo,
        videoUrl,
        isPublished,
        viewCount,
        shareCount,
        type,
        userId,
        deletedAt,
        createdAt,
        updatedAt,
        image,
        videoFile,
        videoLink,
        createdTimeAgo,
        updatedTimeAgo,
      ];

}