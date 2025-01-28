import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_question_type_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum AssessmentQuestionTypeEntity {
  @JsonValue('true_false')
  trueFalse,
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('rearrange')
  rearrange,
  @JsonValue('matching')
  matching,
  @JsonValue('long_answer')
  longAnswer,
  @JsonValue('unknown')
  unknown;

  factory AssessmentQuestionTypeEntity.fromJson(String value) => decodeEnum(
    _$AssessmentQuestionTypeEntityEnumMap,
    value,
    unknownValue: AssessmentQuestionTypeEntity.unknown,
  );

  String toJson() => encodeEnum(_$AssessmentQuestionTypeEntityEnumMap, this);

  AssessmentQuestionType toDomainModel() {
    switch (this) {
      case AssessmentQuestionTypeEntity.trueFalse:
        return AssessmentQuestionType.trueFalse;
      case AssessmentQuestionTypeEntity.multipleChoice:
        return AssessmentQuestionType.multipleChoice;
      case AssessmentQuestionTypeEntity.rearrange:
        return AssessmentQuestionType.rearrange;
      case AssessmentQuestionTypeEntity.matching:
        return AssessmentQuestionType.matching;
      case AssessmentQuestionTypeEntity.longAnswer:
        return AssessmentQuestionType.longAnswer;
      default:
        return AssessmentQuestionType.unknown;
    }
  }
}