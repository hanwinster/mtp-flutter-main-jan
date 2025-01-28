// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thematic_group_post_reaction_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThematicGroupPostReactionRM _$ThematicGroupPostReactionRMFromJson(
        Map<String, dynamic> json) =>
    ThematicGroupPostReactionRM(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      groupId: (json['tgroup_id'] as num?)?.toInt(),
      reactionToId: (json['reaction_to_id'] as num?)?.toInt(),
      reactionToType: json['reaction_to_type'] as String?,
      reactionType: json['reaction_type'] as String?,
      active: (json['active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
    );
