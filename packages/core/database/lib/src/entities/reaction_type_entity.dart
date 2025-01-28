import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reaction_type_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum ReactionTypeEntity {
  @JsonValue('like')
  like,
  @JsonValue('insightful')
  insightful,
  @JsonValue('thankyou')
  thankYou,
  @JsonValue('question')
  question,
  @JsonValue('wow')
  @JsonValue('inspiring')
  inspiring,
  @JsonValue('informative')
  informative,
  wow,
  @JsonValue('unknown')
  unknown;

  factory ReactionTypeEntity.fromJson(String value) => decodeEnum(
    _$ReactionTypeEntityEnumMap,
    value,
    unknownValue: ReactionTypeEntity.unknown,
  );

  String toJson() => encodeEnum(_$ReactionTypeEntityEnumMap, this);

  ReactionType toDomainModel() {
    switch (this) {
      case ReactionTypeEntity.like:
        return ReactionType.like;
      case ReactionTypeEntity.insightful:
        return ReactionType.insightful;
      case ReactionTypeEntity.thankYou:
        return ReactionType.thankYou;
      case ReactionTypeEntity.question:
        return ReactionType.question;
      case ReactionTypeEntity.wow:
        return ReactionType.wow;
      case ReactionTypeEntity.inspiring:
        return ReactionType.inspiring;
      case ReactionTypeEntity.informative:
        return ReactionType.informative;
      case ReactionTypeEntity.unknown:
        return ReactionType.unknown;
    }
  }

  factory ReactionTypeEntity.fromDomainModel(ReactionType reactionType) {
    switch (reactionType) {
      case ReactionType.like:
        return ReactionTypeEntity.like;
      case ReactionType.insightful:
        return ReactionTypeEntity.insightful;
      case ReactionType.thankYou:
        return ReactionTypeEntity.thankYou;
      case ReactionType.question:
        return ReactionTypeEntity.question;
      case ReactionType.wow:
        return ReactionTypeEntity.wow;
      case ReactionType.inspiring:
        return ReactionTypeEntity.inspiring;
      case ReactionType.informative:
        return ReactionTypeEntity.informative;
      case ReactionType.unknown:
        return ReactionTypeEntity.unknown;
    }
  }
}


