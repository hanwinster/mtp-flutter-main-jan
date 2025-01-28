import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_reaction_rm.g.dart';

@JsonSerializable(createToJson: false)
class UserReactionRm {
  final int? id;
  final int? userId;
  final int? tgroupId;
  final int? reactionToId;
  final String? reactionToType;
  final String? reactionType;
  final int? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? username;
  final String? userAvatar;

  UserReactionRm({
    this.id,
    this.userId,
    this.tgroupId,
    this.reactionToId,
    this.reactionToType,
    this.reactionType,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.userAvatar,
  });

  factory UserReactionRm.fromJson(Map<String, dynamic> json) =>
      _$UserReactionRmFromJson(json);

  UserReaction toDomainModel() {
    return UserReaction(
      id: id,
      userId: userId,
      tgroupId: tgroupId,
      reactionToId: reactionToId,
      reactionToType: reactionToType,
      reactionType: reactionType,
      active: active,
      createdAt: createdAt,
      updatedAt: updatedAt,
      username: username,
      userAvatar: userAvatar,
    );
  }
}
