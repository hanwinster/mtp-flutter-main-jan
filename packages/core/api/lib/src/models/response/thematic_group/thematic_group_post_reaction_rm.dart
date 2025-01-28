import 'package:api/api.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_post_reaction_rm.g.dart';

@JsonSerializable(createToJson: false)
class ThematicGroupPostReactionRM {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'tgroup_id')
  final int? groupId;

  @JsonKey(name: 'reaction_to_id')
  final int? reactionToId;

  @JsonKey(name: 'reaction_to_type')
  final String? reactionToType;

  @JsonKey(name: 'reaction_type')
  final String? reactionType;

  @JsonKey(name: 'active')
  final int? active;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'user')
  final UserRM? user;

  ThematicGroupPostReactionRM({
    this.id,
    this.userId,
    this.groupId,
    this.reactionToId,
    this.reactionToType,
    this.reactionType,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ThematicGroupPostReactionRM.fromJson(
      Map<String, dynamic> json) =>
      _$ThematicGroupPostReactionRMFromJson(json);

  Reaction toDomainModel() {
    return Reaction(
      id: id?.toString() ?? (throw Exception('id is null')),
      reactionToId: reactionToId?.toString() ?? '',
      reactionToType: reactionToType ?? '',
      reactionType: ReactionType.unknown, //TODO:
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: null,
      user: user?.toDomainModel() ?? User.empty(),
    );
  }

}
