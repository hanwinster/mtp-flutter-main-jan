import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ThematicGroupPostComment extends Equatable {
  final String id;
  final String userId;
  final int postId;
  final String description;
  final int active;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String username;
  final String userAvatar;
  final String imageUrl;
  final String uploadedVideoUrl;
  final int replyCount;
  final Reaction? userReaction;
  final int numberOfReactions;
  final ImageUrl images;
  final String videoFile;
  final User user;
  final List<ThematicGroupPostCommentReply> commentReplies;

  const ThematicGroupPostComment({
    required this.id,
    required this.userId,
    required this.postId,
    required this.description,
    required this.active,
    required this.username,
    required this.userAvatar,
    required this.imageUrl,
    required this.uploadedVideoUrl,
    required this.replyCount,
    required this.userReaction,
    required this.numberOfReactions,
    required this.images,
    required this.videoFile,
    required this.user,
    required this.commentReplies,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
        id,
        userId,
        postId,
        description,
        active,
        createdAt,
        updatedAt,
        username,
        userAvatar,
        imageUrl,
        uploadedVideoUrl,
        replyCount,
        userReaction,
        numberOfReactions,
        images,
        videoFile,
        user,
        commentReplies,
      ];

  ThematicGroupPostComment copyWith({
    String? id,
    String? userId,
    int? postId,
    String? description,
    int? active,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? username,
    String? userAvatar,
    String? imageUrl,
    String? uploadedVideoUrl,
    int? replyCount,
    Reaction? userReaction,
    int? numberOfReactions,
    ImageUrl? images,
    String? videoFile,
    User? user,
    List<ThematicGroupPostCommentReply>? commentReplies,
  }) {
    return ThematicGroupPostComment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      description: description ?? this.description,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
      userAvatar: userAvatar ?? this.userAvatar,
      imageUrl: imageUrl ?? this.imageUrl,
      uploadedVideoUrl: uploadedVideoUrl ?? this.uploadedVideoUrl,
      replyCount: replyCount ?? this.replyCount,
      userReaction: userReaction ?? this.userReaction,
      numberOfReactions: numberOfReactions ?? this.numberOfReactions,
      images: images ?? this.images,
      videoFile: videoFile ?? this.videoFile,
      user: user ?? this.user,
      commentReplies: commentReplies ?? this.commentReplies,
    );
  }
}