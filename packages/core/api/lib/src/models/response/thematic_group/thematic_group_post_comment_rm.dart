import 'package:api/api.dart';
import 'package:api/src/json/converters/converters.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_post_comment_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class ThematicGroupPostCommentRM {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'tgroup_post_id')
  final int? postId;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'active')
  final int? active;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'user_avatar')
  final String? userAvatar;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'uploaded_video_url')
  final String? uploadedVideoUrl;

  @JsonKey(name: 'reply_count')
  final int? replyCount;

  @JsonKey(name: 'user_reaction')
  final ReactionRM? userReaction;

  @JsonKey(name: 'number_of_reactions')
  final int? numberOfReactions;

  @JsonKey(name: 'images')
  final ImageUrlRM? images;

  @JsonKey(name: 'video_file')
  final String? videoFile;

  @JsonKey(name: 'user')
  final UserRM? user;

  @JsonKey(name: 'comment_replies')
  final List<ThematicGroupPostCommentReplyRM>? commentReplies;

  @JsonKey(name: 'comment_reactions')
  final List<ThematicGroupPostReactionRM>? commentReactions;

  ThematicGroupPostCommentRM({
    this.id,
    this.userId,
    this.postId,
    this.description,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.userAvatar,
    this.imageUrl,
    this.uploadedVideoUrl,
    this.replyCount,
    this.userReaction,
    this.numberOfReactions,
    this.images,
    this.videoFile,
    this.user,
    this.commentReplies,
    this.commentReactions,
  });

  ThematicGroupPostComment toDomainModel() {
    return ThematicGroupPostComment(
      id: id?.toString() ?? (throw Exception('id is null')),
      userId: userId?.toString() ?? '',
      postId: postId ?? 0,
      description: description ?? '',
      active: active ?? 0,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
      username: username ?? '',
      userAvatar: userAvatar ?? '',
      imageUrl: imageUrl ?? '',
      uploadedVideoUrl: uploadedVideoUrl ?? '',
      replyCount: replyCount ?? 0,
      userReaction: userReaction?.toDomainModel(),
      numberOfReactions: numberOfReactions ?? 0,
      images: images?.toDomainModel() ?? ImageUrl.empty(),
      videoFile: videoFile ?? '',
      user: user?.toDomainModel() ?? User.empty(),
      commentReplies:
          commentReplies?.map((e) => e.toDomainModel()).toList() ?? [],
    );
  }

  factory ThematicGroupPostCommentRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupPostCommentRMFromJson(json);
}
