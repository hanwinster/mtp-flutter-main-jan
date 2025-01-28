import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../json/converters/converters.dart';

part 'blog_post_comment_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class BlogPostCommentRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "blog_id")
  final int? postId;
  @JsonKey(name: "user")
  final UserRM? user;
  @JsonKey(name: "description")
  final String? text;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'uploaded_video_url')
  final String? videoUrl;
  @JsonKey(name: "number_of_reactions")
  final int? numberOfReactions;
  @JsonKey(name: "reply_count")
  final int? replyCount;
  @JsonKey(name: 'my_reaction')
  final ReactionRM? currentReaction;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  List<Object?> get props =>
      [
        id,
        postId,
        user,
        text,
        imageUrl,
        videoUrl,
        numberOfReactions,
        replyCount,
        currentReaction,
        createdAt,
        updatedAt,
      ];

  factory BlogPostCommentRM.fromJson(Map<String, dynamic> json) =>
      _$BlogPostCommentRMFromJson(json);

  BlogPostComment toDomainModel() =>
      BlogPostComment(
        id: id?.toString() ?? (throw Exception("id must not be null")),
        postId: postId?.toString() ?? (throw Exception("postId must not be null")),
        text: text ?? '',
        createdAt: createdAt ?? DateTime.now(),
        updatedAt: updatedAt ?? DateTime.now(),
        user: user?.toDomainModel(),
        //TODO: throws if user is null
        imageUrl: imageUrl ?? '',
        videoUrl: videoUrl ?? '',
        replyCount: replyCount ?? 0,
        numberOfReactions: numberOfReactions ?? 0,
        currentReaction: currentReaction?.toDomainModel(),
      );

  const BlogPostCommentRM({
    this.id,
    this.postId,
    this.user,
    this.text,
    this.imageUrl,
    this.videoUrl,
    this.numberOfReactions,
    this.replyCount,
    this.currentReaction,
    this.createdAt,
    this.updatedAt,
  });
}
