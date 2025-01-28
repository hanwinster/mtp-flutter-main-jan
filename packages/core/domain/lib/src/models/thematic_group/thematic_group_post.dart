import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class ThematicGroupPost extends Equatable {
  final int id;
  final int userId;
  final int groupId;
  final String slug;
  final String description;
  final String youtubeLink;
  final dynamic taggedUsers;
  final int shares;
  final int viewCount;
  final int active;
  final dynamic approvedBy;
  final dynamic deactivatedBy;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String username;
  final String userAvatar;
  final bool isOwner;
  final dynamic myReaction;
  final dynamic taggedUserInfo;
  final int numberOfReactions;
  final int numberOfComments;
  final String? imageUrl;
  final String? uploadedVideoUrl;
  final ImageUrl coverImages;
  final String videoFile;
  final User user;
   final UserReaction? userReaction;
  const ThematicGroupPost({
    required this.id,
    required this.userId,
    required this.groupId,
    required this.slug,
    required this.description,
    required this.youtubeLink,
    required this.taggedUsers,
    required this.shares,
    required this.viewCount,
    required this.active,
    required this.approvedBy,
    required this.deactivatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.userAvatar,
    required this.isOwner,
    required this.myReaction,
    required this.taggedUserInfo,
    required this.numberOfReactions,
    required this.numberOfComments,
    required this.imageUrl,
    required this.uploadedVideoUrl,
    required this.coverImages,
    required this.videoFile,
    required this.user,
    this.userReaction
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    groupId,
    slug,
    description,
    youtubeLink,
    taggedUsers,
    shares,
    viewCount,
    active,
    approvedBy,
    deactivatedBy,
    createdAt,
    updatedAt,
    username,
    userAvatar,
    isOwner,
    myReaction,
    taggedUserInfo,
    numberOfReactions,
    numberOfComments,
    imageUrl,
    uploadedVideoUrl,
    coverImages,
    videoFile,
    user,
    userReaction
  ];
}
