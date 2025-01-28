import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assessment_question_passing_option_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum AssessmentQuestionPassingOptionEntity {
  @JsonValue('after_providing_answer')
  afterProvidingAnswer,
  @JsonValue('after_sending_feedback')
  afterSendingFeedback,
  @JsonValue('after_setting_pass')
  afterSettingPass,
  @JsonValue('unknown')
  unknown;

  factory AssessmentQuestionPassingOptionEntity.fromJson(String value) => decodeEnum(
    _$AssessmentQuestionPassingOptionEntityEnumMap,
    value,
    unknownValue: AssessmentQuestionPassingOptionEntity.unknown,
  );

  String toJson() => encodeEnum(_$AssessmentQuestionPassingOptionEntityEnumMap, this);

  AssessmentQuestionPassingOption toDomainModel() {
    switch (this) {
      case AssessmentQuestionPassingOptionEntity.afterProvidingAnswer:
        return AssessmentQuestionPassingOption.afterProvidingAnswer;
      case AssessmentQuestionPassingOptionEntity.afterSendingFeedback:
        return AssessmentQuestionPassingOption.afterSendingFeedback;
      case AssessmentQuestionPassingOptionEntity.afterSettingPass:
        return AssessmentQuestionPassingOption.afterSettingPass;
      default:
        return AssessmentQuestionPassingOption.unknown;
    }
  }
}