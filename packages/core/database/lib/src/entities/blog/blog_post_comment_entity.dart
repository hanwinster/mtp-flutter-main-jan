import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class BlogPostCommentEntity extends Equatable {
  final String id;
  final String postId;
  final UserEntity? user;
  final String text;
  final String imageUrl;
  final String videoUrl;
  final int replyCount;
  final int numberOfReactions;
  final ReactionEntity? currentReaction;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BlogPostCommentEntity({
    required this.id,
    required this.postId,
    required this.user,
    required this.text,
    required this.imageUrl,
    required this.videoUrl,
    required this.replyCount,
    required this.numberOfReactions,
    required this.currentReaction,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
        id,
        postId,
        text,
        user,
        imageUrl,
        videoUrl,
        replyCount,
        numberOfReactions,
        currentReaction,
        createdAt,
        updatedAt,
      ];

  BlogPostComment toDomainModel() {
    return BlogPostComment(
      id: id,
      postId: postId,
      text: text,
      createdAt: createdAt,
      updatedAt: updatedAt,
      user: user?.toDomainModel(),
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      replyCount: replyCount,
      numberOfReactions: numberOfReactions,
      currentReaction: currentReaction?.toDomainModel(),
    );
  }

  BlogPostCommentEntity copyWith({
    String? id,
    String? postId,
    UserEntity? user,
    String? text,
    String? imageUrl,
    String? videoUrl,
    int? replyCount,
    int? numberOfReactions,
    ReactionEntity? Function()? currentReaction,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BlogPostCommentEntity(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      user: user ?? this.user,
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      replyCount: replyCount ?? this.replyCount,
      numberOfReactions: numberOfReactions ?? this.numberOfReactions,
      currentReaction: currentReaction != null ? currentReaction() : this.currentReaction,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
