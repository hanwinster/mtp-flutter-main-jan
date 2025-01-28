import 'package:api/api.dart';
import 'package:database/database.dart';

extension AssessmentQuestionPassingOptionRMEntityMapper on AssessmentQuestionPassingOptionRM {
  AssessmentQuestionPassingOptionEntity toEntity() {
    switch (this) {
      case AssessmentQuestionPassingOptionRM.afterProvidingAnswer:
        return AssessmentQuestionPassingOptionEntity.afterProvidingAnswer;
      case AssessmentQuestionPassingOptionRM.afterSendingFeedback:
        return AssessmentQuestionPassingOptionEntity.afterSendingFeedback;
      case AssessmentQuestionPassingOptionRM.afterSettingPass:
        return AssessmentQuestionPassingOptionEntity.afterSettingPass;
      case AssessmentQuestionPassingOptionRM.unknown:
        return AssessmentQuestionPassingOptionEntity.unknown;
    }
  }
}
