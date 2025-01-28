// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionEntity _$ReactionEntityFromJson(Map<String, dynamic> json) =>
    ReactionEntity(
      id: json['id'] as String,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      reactionToId: json['reaction_to_id'] as String,
      reactionToType: json['reaction_to_type'] as String,
      reactionType: json['reaction_type'] == null
          ? null
          : ReactionTypeEntity.fromJson(json['reaction_type'] as String),
      active: json['active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ReactionEntityToJson(ReactionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'reaction_to_id': instance.reactionToId,
      'reaction_to_type': instance.reactionToType,
      'reaction_type': instance.reactionType?.toJson(),
      'active': instance.active,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
