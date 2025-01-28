import 'package:api/src/models/models.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../json/converters/converters.dart';

part 'reaction_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
class ReactionRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "user")
  final UserRM? user;
  @JsonKey(name: "reaction_to_id")
  final int? reactionToId;
  @JsonKey(name: "reaction_to_type")
  final String? reactionToType;
  @JsonKey(name: "reaction_type", unknownEnumValue: ReactionTypeRM.unknown)
  final ReactionTypeRM? reactionType;
  @JsonKey(name: "active")
  final int? active;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const ReactionRM({
    this.id,
    this.user,
    this.reactionToId,
    this.reactionToType,
    this.reactionType,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

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

  factory ReactionRM.fromJson(Map<String, dynamic> json) =>
      _$ReactionRMFromJson(json);

  Reaction toDomainModel() {
    return Reaction(
      id: id?.toString() ?? (throw Exception("id is null")),
      reactionToId: reactionToId?.toString() ?? (throw Exception("reactionToId is null")),
      reactionToType: reactionToType ?? (throw Exception("reactionToType is null")),
      reactionType: reactionType?.toDomainModel() ?? ReactionType.unknown,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
