import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reaction_type_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum ReactionTypeRM {
  @JsonValue('like')
  like,
  @JsonValue('insightful')
  insightful,
  @JsonValue('thankyou')
  thankYou,
  @JsonValue('question')
  question,
  @JsonValue('wow')
  wow,
  @JsonValue('inspiring')
  inspiring,
  @JsonValue('informative')
  informative,
  @JsonValue('unknown')
  unknown;

  factory ReactionTypeRM.fromJson(String value) => decodeEnum(
        _$ReactionTypeRMEnumMap,
        value,
        unknownValue: ReactionTypeRM.unknown,
      );

  String toJson() => encodeEnum(_$ReactionTypeRMEnumMap, this);

  ReactionType toDomainModel() {
    switch (this) {
      case ReactionTypeRM.like:
        return ReactionType.like;
      case ReactionTypeRM.insightful:
        return ReactionType.insightful;
      case ReactionTypeRM.thankYou:
        return ReactionType.thankYou;
      case ReactionTypeRM.question:
        return ReactionType.question;
      case ReactionTypeRM.wow:
        return ReactionType.wow;
      case ReactionTypeRM.inspiring:
        return ReactionType.inspiring;
      case ReactionTypeRM.informative:
        return ReactionType.informative;
      case ReactionTypeRM.unknown:
        return ReactionType.unknown;
    }
  }

  factory ReactionTypeRM.fromDomainModel(ReactionType reactionType) {
    switch (reactionType) {
      case ReactionType.like:
        return ReactionTypeRM.like;
      case ReactionType.insightful:
        return ReactionTypeRM.insightful;
      case ReactionType.thankYou:
        return ReactionTypeRM.thankYou;
      case ReactionType.question:
        return ReactionTypeRM.question;
      case ReactionType.wow:
        return ReactionTypeRM.wow;
      case ReactionType.inspiring:
        return ReactionTypeRM.inspiring;
      case ReactionType.informative:
        return ReactionTypeRM.informative;
      case ReactionType.unknown:
        return ReactionTypeRM.unknown;
    }
  }
}
