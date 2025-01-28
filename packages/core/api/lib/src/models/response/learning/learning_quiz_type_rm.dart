import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_quiz_type_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum LearningQuizTypeRM {
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

  factory LearningQuizTypeRM.fromJson(String value) => decodeEnum(
        _$LearningQuizTypeRMEnumMap,
        value,
        unknownValue: LearningQuizTypeRM.unknown,
      );

  String toJson() => encodeEnum(_$LearningQuizTypeRMEnumMap, this);

  LearningQuizType toDomainModel() {
    switch (this) {
      case LearningQuizTypeRM.trueFalse:
        return LearningQuizType.trueFalse;
      case LearningQuizTypeRM.shortQuestion:
        return LearningQuizType.shortQuestion;
      case LearningQuizTypeRM.longQuestion:
        return LearningQuizType.longQuestion;
      case LearningQuizTypeRM.fillInTheBlank:
        return LearningQuizType.fillInTheBlank;
      case LearningQuizTypeRM.multipleChoice:
        return LearningQuizType.multipleChoice;
      case LearningQuizTypeRM.rearrange:
        return LearningQuizType.rearrange;
      case LearningQuizTypeRM.matching:
        return LearningQuizType.matching;
      case LearningQuizTypeRM.assignment:
        return LearningQuizType.assignment;
      default:
        return LearningQuizType.unknown;
    }
  }
}
