import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thematic_group_reaction_to_type_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum ThematicGroupReactionToTypeRM {
  @JsonValue('post')
  post,
  @JsonValue('comment')
  comment,
  @JsonValue('reply_to_comment')
  replyToComment,
  @JsonValue('unknown')
  unknown;

  factory ThematicGroupReactionToTypeRM.fromJson(String value) => decodeEnum(
    _$ThematicGroupReactionToTypeRMEnumMap,
    value,
    unknownValue: ThematicGroupReactionToTypeRM.unknown,
  );

  String toJson() => encodeEnum(_$ThematicGroupReactionToTypeRMEnumMap, this);

  factory ThematicGroupReactionToTypeRM.fromDomainModel(ThematicGroupReactionToType domainModel) {
    switch (domainModel) {
      case ThematicGroupReactionToType.post:
        return ThematicGroupReactionToTypeRM.post;
      case ThematicGroupReactionToType.comment:
        return ThematicGroupReactionToTypeRM.comment;
      case ThematicGroupReactionToType.replyToComment:
        return ThematicGroupReactionToTypeRM.replyToComment;
      default:
        return ThematicGroupReactionToTypeRM.unknown;
    }
  }
}