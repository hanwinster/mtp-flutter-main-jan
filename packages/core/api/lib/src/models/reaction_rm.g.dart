// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionRM _$ReactionRMFromJson(Map<String, dynamic> json) => ReactionRM(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
      reactionToId: (json['reaction_to_id'] as num?)?.toInt(),
      reactionToType: json['reaction_to_type'] as String?,
      reactionType: json['reaction_type'] == null
          ? null
          : ReactionTypeRM.fromJson(json['reaction_type'] as String),
      active: (json['active'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );
