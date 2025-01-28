import 'package:api/api.dart';
import 'package:api/src/json/converters/converters.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_post_details_rm.g.dart';

@JsonSerializable(createToJson: false)
class GroupPostDetailsRM {
  @JsonKey(name: 'data')
  final GroupPostDetailsDataRM? data;

  GroupPostDetailsRM({this.data});

  factory GroupPostDetailsRM.fromJson(Map<String, dynamic> json) => _$GroupPostDetailsRMFromJson(json);

  GroupPostDetails toDomainModel() {
    return GroupPostDetails(
      data: data?.toDomainModel(),
    );
  }
}

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class GroupPostDetailsDataRM {
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
  final String? approvedBy;
  @JsonKey(name: 'deactivated_by')
  final String? deactivatedBy;
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

  GroupPostDetailsDataRM({
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

  factory GroupPostDetailsDataRM.fromJson(Map<String, dynamic> json) =>
      _$GroupPostDetailsDataRMFromJson(json);

  GroupPostDetailsData toDomainModel() {
    print("uploaded video url is : $uploadedVideoUrl");
    return GroupPostDetailsData(
      id: id,
      userId: userId,
      tgroupId: tgroupId,
      slug: slug,
      description: description,
      youtubeLink: youtubeLink,
      taggedUsers: taggedUsers,
      shares: shares,
      viewCount: viewCount,
      active: active,
      approvedBy: approvedBy,
      deactivatedBy: deactivatedBy,
      createdAt: createdAt,
      updatedAt: updatedAt,
      username: username,
      userAvatar: userAvatar,
      isOwner: isOwner,
      myReaction: myReaction,
      taggedUserInfo: taggedUserInfo,
      numberOfReactions: numberOfReactions,
      numberOfComments: numberOfComments,
      imageUrl: imageUrl,
      uploadedVideoUrl: uploadedVideoUrl,
      coverImages: coverImages?.toDomainModel(),
      videoFile: videoFile,
      user: user?.toDomainModel(),
    );
  }
}

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class ThematicGroupPostDetailsCommentsRM {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'post_id')
  final int? postId;

  @JsonKey(name: 'comment_type')
  final String? commentType;

  @JsonKey(name: 'reply_id')
  final int? replyId;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'active')
  final int? active;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'my_reaction')
  final String? myReaction;

  @JsonKey(name: 'number_of_reactions')
  final int? numberOfReactions;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'user_avatar')
  final String? userAvatar;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'images')
  final ImageUrlRM? images;

  @JsonKey(name: 'video_file')
  final String? videoUrl;

  @JsonKey(name: 'user')
  final UserRM? user;

  ThematicGroupPostDetailsCommentsRM({
    this.id,
    this.userId,
    this.postId,
    this.commentType,
    this.replyId,
    this.description,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.myReaction,
    this.numberOfReactions,
    this.username,
    this.userAvatar,
    this.imageUrl,
    this.videoUrl,
    this.images,
    this.user,
  });

  factory ThematicGroupPostDetailsCommentsRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupPostDetailsCommentsRMFromJson(json);
}