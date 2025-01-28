import 'package:api/api.dart';
import 'package:database/database.dart';


extension AssessmentUserAnswerPassOptionRMEntityMapper on AssessmentUserAnswerPassOptionRM {
  AssessmentUserAnswerPassOptionEntity toEntity() {
    switch (this) {
      case AssessmentUserAnswerPassOptionRM.submitted:
        return AssessmentUserAnswerPassOptionEntity.submitted;
      case AssessmentUserAnswerPassOptionRM.pass:
        return AssessmentUserAnswerPassOptionEntity.pass;
      case AssessmentUserAnswerPassOptionRM.retake:
        return AssessmentUserAnswerPassOptionEntity.retake;
      case AssessmentUserAnswerPassOptionRM.unknown:
        return AssessmentUserAnswerPassOptionEntity.unknown;
    }
  }
}
