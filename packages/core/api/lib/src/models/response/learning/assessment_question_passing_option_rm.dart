import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_question_passing_option_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum AssessmentQuestionPassingOptionRM {
  @JsonValue('after_providing_answer')
  afterProvidingAnswer,
  @JsonValue('after_sending_feedback')
  afterSendingFeedback,
  @JsonValue('after_setting_pass')
  afterSettingPass,
  @JsonValue('unknown')
  unknown;

  factory AssessmentQuestionPassingOptionRM.fromJson(String value) =>
      decodeEnum(
        _$AssessmentQuestionPassingOptionRMEnumMap,
        value,
        unknownValue: AssessmentQuestionPassingOptionRM.unknown,
      );

  String toJson() =>
      encodeEnum(_$AssessmentQuestionPassingOptionRMEnumMap, this);

  AssessmentQuestionPassingOption toDomainModel() {
    switch (this) {
      case AssessmentQuestionPassingOptionRM.afterProvidingAnswer:
        return AssessmentQuestionPassingOption.afterProvidingAnswer;
      case AssessmentQuestionPassingOptionRM.afterSendingFeedback:
        return AssessmentQuestionPassingOption.afterSendingFeedback;
      case AssessmentQuestionPassingOptionRM.afterSettingPass:
        return AssessmentQuestionPassingOption.afterSettingPass;
      default:
        return AssessmentQuestionPassingOption.unknown;
    }
  }
}
