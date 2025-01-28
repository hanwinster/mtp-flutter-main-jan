// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reaction_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReactionRm _$UserReactionRmFromJson(Map<String, dynamic> json) =>
    UserReactionRm(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      tgroupId: (json['tgroupId'] as num?)?.toInt(),
      reactionToId: (json['reactionToId'] as num?)?.toInt(),
      reactionToType: json['reactionToType'] as String?,
      reactionType: json['reactionType'] as String?,
      active: (json['active'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      username: json['username'] as String?,
      userAvatar: json['userAvatar'] as String?,
    );
