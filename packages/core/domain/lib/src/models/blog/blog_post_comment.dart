import 'package:base/base.dart';
import 'package:domain/domain.dart';

class BlogPostComment extends Equatable {
  final String id;
  final String postId;
  final String text;
  //TODO: change to non-nullable
  final User? user;
  final String imageUrl;
  final String videoUrl;
  final int replyCount;
  final int numberOfReactions;
  final Reaction? currentReaction;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BlogPostComment({
    required this.id,
    required this.postId,
    required this.text,
    required this.user,
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
}
