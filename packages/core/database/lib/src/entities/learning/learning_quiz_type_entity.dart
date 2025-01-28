import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_type_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum LearningQuizTypeEntity {
  @JsonValue('true_false')
  trueFalse,
  @JsonValue('short_question')
  shortQuestion,
  @JsonValue('long_question')
  longQuestion,
  @JsonValue('blank')
  fillInTheBlank,
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('rearrange')
  rearrange,
  @JsonValue('matching')
  matching,
  @JsonValue('assignment')
  assignment,
  @JsonValue('unknown')
  unknown;

  factory LearningQuizTypeEntity.fromJson(String value) => decodeEnum(
        _$LearningQuizTypeEntityEnumMap,
        value,
        unknownValue: LearningQuizTypeEntity.unknown,
      );

  String toJson() => encodeEnum(_$LearningQuizTypeEntityEnumMap, this);

  LearningQuizType toDomainModel() {
    switch (this) {
      case LearningQuizTypeEntity.trueFalse:
        return LearningQuizType.trueFalse;
      case LearningQuizTypeEntity.shortQuestion:
        return LearningQuizType.shortQuestion;
      case LearningQuizTypeEntity.longQuestion:
        return LearningQuizType.longQuestion;
      case LearningQuizTypeEntity.fillInTheBlank:
        return LearningQuizType.fillInTheBlank;
      case LearningQuizTypeEntity.multipleChoice:
        return LearningQuizType.multipleChoice;
      case LearningQuizTypeEntity.rearrange:
        return LearningQuizType.rearrange;
      case LearningQuizTypeEntity.matching:
        return LearningQuizType.matching;
      case LearningQuizTypeEntity.assignment:
        return LearningQuizType.assignment;
      default:
        return LearningQuizType.unknown;
    }
  }
}
