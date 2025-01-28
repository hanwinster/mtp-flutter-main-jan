import 'package:api/api.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_post_comment_reply_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupPostCommentReplyRM {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'comment_id')
  final int? commentId;

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

  @JsonKey(name: 'user_reaction')
  final ReactionRM? userReaction;

  @JsonKey(name: 'number_of_reactions')
  final int? numberOfReactions;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'user_avatar')
  final String? userAvatar;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'reply_to')
  final ThematicGroupPostCommentUserRM? replyTo;

  @JsonKey(name: 'images')
  final ImageUrlRM? images;

  @JsonKey(name: 'user')
  final UserRM? user;

  ThematicGroupPostCommentReplyRM({
    this.id,
    this.userId,
    this.commentId,
    this.commentType,
    this.replyId,
    this.description,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.userReaction,
    this.numberOfReactions,
    this.username,
    this.userAvatar,
    this.imageUrl,
    this.replyTo,
    this.images,
    this.user,
  });

  factory ThematicGroupPostCommentReplyRM.fromJson(Map<String, dynamic> json) =>
      _$ThematicGroupPostCommentReplyRMFromJson(json);

  ThematicGroupPostCommentReply toDomainModel() {
    return ThematicGroupPostCommentReply(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      userId: userId ?? 0,
      commentId: commentId?.toString() ?? '',
      commentType: commentType ?? '',
      replyId: replyId ?? 0,
      description: description ?? '',
      active: active == 1,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
      userReaction: userReaction?.toDomainModel(),
      numberOfReactions: numberOfReactions ?? 0,
      username: username ?? '',
      userAvatar: userAvatar ?? '',
      imageUrl: imageUrl ?? '',
      replyToUser: replyTo?.toDomainModel() ?? ThematicGroupPostCommentUser.empty(),
      images: images?.toDomainModel() ?? ImageUrl.empty(),
      user: user?.toDomainModel() ?? User.empty(),
    );
  }
}
