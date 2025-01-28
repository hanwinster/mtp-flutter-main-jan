import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_question_type_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum AssessmentQuestionTypeRM {
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

  factory AssessmentQuestionTypeRM.fromJson(String value) => decodeEnum(
    _$AssessmentQuestionTypeRMEnumMap,
    value,
    unknownValue: AssessmentQuestionTypeRM.unknown,
  );

  String toJson() => encodeEnum(_$AssessmentQuestionTypeRMEnumMap, this);

  AssessmentQuestionType toDomainModel() {
    switch (this) {
      case AssessmentQuestionTypeRM.trueFalse:
        return AssessmentQuestionType.trueFalse;
      case AssessmentQuestionTypeRM.multipleChoice:
        return AssessmentQuestionType.multipleChoice;
      case AssessmentQuestionTypeRM.rearrange:
        return AssessmentQuestionType.rearrange;
      case AssessmentQuestionTypeRM.matching:
        return AssessmentQuestionType.matching;
      case AssessmentQuestionTypeRM.longAnswer:
        return AssessmentQuestionType.longAnswer;
      default:
        return AssessmentQuestionType.unknown;
    }
  }
}