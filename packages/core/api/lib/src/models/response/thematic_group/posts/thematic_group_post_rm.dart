import 'package:api/api.dart';
import 'package:api/src/models/user_reaction_rm.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_post_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupPostRM {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'tgroup_id')
  final int? tgroupId;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'youtube_link')
  final String? youtubeLink;

  @JsonKey(name: 'tagged_users')
  final String? taggedUsers;

  @JsonKey(name: 'shares')
  final int? shares;

  @JsonKey(name: 'view_count')
  final int? viewCount;

  @JsonKey(name: 'active')
  final int? active;

  @JsonKey(name: 'approved_by')
  final dynamic approvedBy;

  @JsonKey(name: 'deactivated_by')
  final dynamic deactivatedBy;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'user_avatar')
  final String? userAvatar;

  @JsonKey(name: 'is_owner')
  final bool? isOwner;

  @JsonKey(name: 'my_reaction')
  final String? myReaction;

  @JsonKey(name: 'tagged_user_info')
  final String? taggedUserInfo;

  @JsonKey(name: 'number_of_reactions')
  final int? numberOfReactions;

  @JsonKey(name: 'number_of_comments')
  final int? numberOfComments;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'uploaded_video_url')
  final String? uploadedVideoUrl;

  @JsonKey(name: 'cover_images')
  final ImageUrlRM? coverImages;

  @JsonKey(name: 'video_file')
  final String? videoFile;

  @JsonKey(name: 'user')
  final UserRM? user;

  @JsonKey(name: 'user_reaction')  
  final UserReactionRm? userReaction;

  ThematicGroupPostRM({
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
    this.userReaction
  });
 
  ThematicGroupPost toDomainModel() {
    return ThematicGroupPost(
      id: id ?? (throw Exception('id is null')),
      userId: userId ?? 0,
      groupId: tgroupId ?? 0,
      slug: slug ?? '',
      description: description ?? '',
      youtubeLink: youtubeLink ?? '',
      taggedUsers: taggedUsers,
      shares: shares ?? 0,
      viewCount: viewCount ?? 0,
      active: active ?? 0,
      approvedBy: approvedBy,
      deactivatedBy: deactivatedBy,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
      username: username ?? '',
      userAvatar: userAvatar ?? '',
      isOwner: isOwner ?? false,
      myReaction: myReaction,
      taggedUserInfo: taggedUserInfo,
      numberOfReactions: numberOfReactions ?? 0,
      numberOfComments: numberOfComments ?? 0,
      imageUrl: imageUrl,
      uploadedVideoUrl: uploadedVideoUrl,
      coverImages: coverImages?.toDomainModel() ?? ImageUrl.empty(),
      videoFile: videoFile ?? '',
      user: user?.toDomainModel() ?? (throw Exception('user is null')),
     userReaction: userReaction?.toDomainModel(),
    );
  }

  factory ThematicGroupPostRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupPostRMFromJson(json);
}
