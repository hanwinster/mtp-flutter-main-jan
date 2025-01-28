import 'package:domain/domain.dart';

class GroupPostDetails {
  final GroupPostDetailsData? data;

  GroupPostDetails({this.data});
}

class GroupPostDetailsData {
  final int? id;
  final int? userId;
  final int? tgroupId;
  final String? slug;
  final String? description;
  final String? youtubeLink;
  final String? taggedUsers;
  final int? shares;
  final int? viewCount;
  final int? active;
  final String? approvedBy;
  final String? deactivatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? username;
  final String? userAvatar;
  final bool? isOwner;
  final String? myReaction;
  final String? taggedUserInfo;
  final int? numberOfReactions;
  final int? numberOfComments;
  final String? imageUrl;
  final String? uploadedVideoUrl;
  final ImageUrl? coverImages;
  final String? videoFile;
  final User? user;

  GroupPostDetailsData({
    this.id,
    this.userId,
    this.tgroupId,
    this.slug,
    this.description,
    this.youtubeLink,
    this.taggedUsers,
    this.shares,
    this.viewCount,
    this.active,
    this.approvedBy,
    this.deactivatedBy,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.userAvatar,
    this.isOwner,
    this.myReaction,
    this.taggedUserInfo,
    this.numberOfReactions,
    this.numberOfComments,
    this.imageUrl,
    this.uploadedVideoUrl,
    this.coverImages,
    this.videoFile,
    this.user,
  });

  ThematicGroupPost toGroupPost() {
    return ThematicGroupPost(
      id: id ?? 0,
      userId: userId ?? 0,
      groupId: tgroupId ?? 0,
      slug: slug ?? '',
      description: description ?? '',
      youtubeLink: youtubeLink ?? '',
      taggedUsers: taggedUsers ?? '',
      shares: shares ?? 0,
      viewCount: viewCount ?? 0,
      active: active ?? 0,
      approvedBy: approvedBy ?? '',
      deactivatedBy: deactivatedBy ?? '',
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
      username: username ?? '',
      userAvatar: userAvatar ?? '',
      isOwner: isOwner ?? false,
      myReaction: myReaction ?? '',
      taggedUserInfo: taggedUserInfo ?? '',
      numberOfReactions: numberOfReactions ?? 0,
      numberOfComments: numberOfComments ?? 0,
      imageUrl: imageUrl ?? '',
      uploadedVideoUrl: uploadedVideoUrl ?? '',
      coverImages: coverImages ?? ImageUrl.empty(),
      videoFile: videoFile ?? '',
      user: user ?? User.empty(),
    );
  }
}