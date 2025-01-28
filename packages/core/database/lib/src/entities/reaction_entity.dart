import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converters/converters.dart';
import 'entities.dart';

part 'reaction_entity.g.dart';

@JsonSerializable()
@DateTimeStringConverter()
class ReactionEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "user")
  final UserEntity? user;
  @JsonKey(name: "reaction_to_id")
  final String reactionToId;
  @JsonKey(name: "reaction_to_type")
  final String reactionToType;
  @JsonKey(name: "reaction_type", unknownEnumValue: ReactionTypeEntity.unknown)
  final ReactionTypeEntity? reactionType;
  @JsonKey(name: "active")
  final bool active;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        user,
        reactionToId,
        reactionToType,
        reactionType,
        active,
        createdAt,
        updatedAt,
      ];

  factory ReactionEntity.fromJson(Map<String, dynamic> json) =>
      _$ReactionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionEntityToJson(this);

  Reaction toDomainModel() {
    return Reaction(
      id: id,
      reactionToId: reactionToId,
      reactionToType: reactionToType,
      reactionType: reactionType?.toDomainModel() ?? ReactionType.unknown,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  const ReactionEntity({
    required this.id,
    required this.user,
    required this.reactionToId,
    required this.reactionToType,
    required this.reactionType,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });
}
