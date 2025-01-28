import 'package:base/base.dart';  

class UserReaction extends Equatable {
  const UserReaction({
    required this.id,
    required this.userId,
    required this.tgroupId,
    required this.reactionToId,
    required this.reactionToType,
    required this.reactionType,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.userAvatar,
  });

  final int? id;
  final int? userId;
  final int? tgroupId; // Thematic group ID
  final int? reactionToId; // ID of the reacted item
  final String? reactionToType; // Type of reaction target
  final String? reactionType; // The type of reaction (e.g. like, thankyou)
  final int? active; // Active status of the reaction
  final DateTime? createdAt; // Creation timestamp
  final DateTime? updatedAt; // Update timestamp
  final String? username; // Username of the reacting user
  final String? userAvatar; // Avatar of the reacting user

  factory UserReaction.empty() {
    return UserReaction(
      id: null,
      userId: null,
      tgroupId: null,
      reactionToId: null,
      reactionToType: null,
      reactionType: null,
      active: null,
      createdAt: null,
      updatedAt: null,
      username: null,
      userAvatar: null,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    tgroupId,
    reactionToId,
    reactionToType,
    reactionType,
    active,
    createdAt,
    updatedAt,
    username,
    userAvatar,
  ];
}