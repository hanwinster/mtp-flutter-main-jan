import 'package:api/api.dart';
import 'package:database/database.dart';

extension AssessmentQuestionTypeRMEntityMapper on AssessmentQuestionTypeRM {
  AssessmentQuestionTypeEntity toEntity() {
    switch (this) {
      case AssessmentQuestionTypeRM.trueFalse:
        return AssessmentQuestionTypeEntity.trueFalse;
      case AssessmentQuestionTypeRM.multipleChoice:
        return AssessmentQuestionTypeEntity.multipleChoice;
      case AssessmentQuestionTypeRM.rearrange:
        return AssessmentQuestionTypeEntity.rearrange;
      case AssessmentQuestionTypeRM.matching:
        return AssessmentQuestionTypeEntity.matching;
      case AssessmentQuestionTypeRM.longAnswer:
        return AssessmentQuestionTypeEntity.longAnswer;
      default:
        return AssessmentQuestionTypeEntity.unknown;
    }
  }
}
