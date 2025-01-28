import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_user_answer_pass_option_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum AssessmentUserAnswerPassOptionRM {
  @JsonValue('submitted')
  submitted,
  @JsonValue('pass')
  pass,
  @JsonValue('retake')
  retake,
  @JsonValue('unknown')
  unknown;

  factory AssessmentUserAnswerPassOptionRM.fromJson(String value) => decodeEnum(
    _$AssessmentUserAnswerPassOptionRMEnumMap,
    value,
    unknownValue: AssessmentUserAnswerPassOptionRM.unknown,
  );

  String toJson() => encodeEnum(_$AssessmentUserAnswerPassOptionRMEnumMap, this);

  AssessmentUserAnswerPassOption toDomainModel() {
    switch (this) {
      case AssessmentUserAnswerPassOptionRM.submitted:
        return AssessmentUserAnswerPassOption.submitted;
      case AssessmentUserAnswerPassOptionRM.pass:
        return AssessmentUserAnswerPassOption.pass;
      case AssessmentUserAnswerPassOptionRM.retake:
        return AssessmentUserAnswerPassOption.retake;
      case AssessmentUserAnswerPassOptionRM.unknown:
        return AssessmentUserAnswerPassOption.unknown;
    }
  }
}