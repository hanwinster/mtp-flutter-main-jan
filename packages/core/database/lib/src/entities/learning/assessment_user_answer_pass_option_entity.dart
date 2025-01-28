
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_user_answer_pass_option_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum AssessmentUserAnswerPassOptionEntity {
  @JsonValue('submitted')
  submitted,
  @JsonValue('pass')
  pass,
  @JsonValue('retake')
  retake,
  @JsonValue('unknown')
  unknown;

  factory AssessmentUserAnswerPassOptionEntity.fromJson(String value) => decodeEnum(
    _$AssessmentUserAnswerPassOptionEntityEnumMap,
    value,
    unknownValue: AssessmentUserAnswerPassOptionEntity.unknown,
  );

  String toJson() => encodeEnum(_$AssessmentUserAnswerPassOptionEntityEnumMap, this);

  AssessmentUserAnswerPassOption toDomainModel() {
    switch (this) {
      case AssessmentUserAnswerPassOptionEntity.submitted:
        return AssessmentUserAnswerPassOption.submitted;
      case AssessmentUserAnswerPassOptionEntity.pass:
        return AssessmentUserAnswerPassOption.pass;
      case AssessmentUserAnswerPassOptionEntity.retake:
        return AssessmentUserAnswerPassOption.retake;
      case AssessmentUserAnswerPassOptionEntity.unknown:
        return AssessmentUserAnswerPassOption.unknown;
    }
  }
}