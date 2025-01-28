import 'package:base/base.dart';

class CommunityVideoModel extends Equatable{
  final int id;
  final String title;
  final String slug;
  final String description;
  final int isYoutubeVideo;
  final String videoUrl;
  final int isPublished;
  
  final int viewCount;
  final int shareCount;
  final String type;
  final int userId;
  final String deletedAt;
  final String createdAt;
  final String updatedAt;
  final String image;
  final String videoFile;
  final String videoLink;
  final String createdTimeAgo;
  final String updatedTimeAgo;

  const CommunityVideoModel({
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

  @override
  List<Object> get props =>
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