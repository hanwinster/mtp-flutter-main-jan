import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ThematicGroupPostCommentReply extends Equatable {
  final String id;
  final int userId;
  final String commentId;
  final String commentType;
  final int replyId;
  final String description;
  final bool active;
  final Reaction? userReaction;
  final int numberOfReactions;
  final String username;
  final String userAvatar;
  final String imageUrl;
  final ImageUrl images;
  final User user;
  final ThematicGroupPostCommentUser replyToUser;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ThematicGroupPostCommentReply({
    required this.id,
    required this.userId,
    required this.commentId,
    required this.commentType,
    required this.replyId,
    required this.description,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.userReaction,
    required this.numberOfReactions,
    required this.username,
    required this.userAvatar,
    required this.imageUrl,
    required this.user,
    required this.replyToUser,
    required this.images,
  });

  @override
  List<Object?> get props =>
      [
        id,
        userId,
        commentId,
        commentType,
        replyId,
        description,
        active,
        userReaction,
        numberOfReactions,
        username,
        userAvatar,
        imageUrl,
        images,
        user,
        replyToUser,
        createdAt,
        updatedAt,
      ];

  ThematicGroupPostCommentReply copyWith({
    String? id,
    int? userId,
    String? commentId,
    String? commentType,
    int? replyId,
    String? description,
    bool? active,
    Reaction? userReaction,
    int? numberOfReactions,
    String? username,
    String? userAvatar,
    String? imageUrl,
    ImageUrl? images,
    User? user,
    ThematicGroupPostCommentUser? replyToUser,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ThematicGroupPostCommentReply(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      commentId: commentId ?? this.commentId,
      commentType: commentType ?? this.commentType,
      replyId: replyId ?? this.replyId,
      description: description ?? this.description,
      active: active ?? this.active,
      userReaction: userReaction ?? this.userReaction,
      numberOfReactions: numberOfReactions ?? this.numberOfReactions,
      username: username ?? this.username,
      userAvatar: userAvatar ?? this.userAvatar,
      imageUrl: imageUrl ?? this.imageUrl,
      images: images ?? this.images,
      user: user ?? this.user,
      replyToUser: replyToUser ?? this.replyToUser,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}


