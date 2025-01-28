import 'package:api/api.dart';
import 'package:database/database.dart';

extension LearningQuizTypeRMEntityMapper on LearningQuizTypeRM {
  LearningQuizTypeEntity toEntity() {
    switch (this) {
      case LearningQuizTypeRM.trueFalse:
        return LearningQuizTypeEntity.trueFalse;
      case LearningQuizTypeRM.shortQuestion:
        return LearningQuizTypeEntity.shortQuestion;
      case LearningQuizTypeRM.longQuestion:
        return LearningQuizTypeEntity.longQuestion;
      case LearningQuizTypeRM.fillInTheBlank:
        return LearningQuizTypeEntity.fillInTheBlank;
      case LearningQuizTypeRM.multipleChoice:
        return LearningQuizTypeEntity.multipleChoice;
      case LearningQuizTypeRM.rearrange:
        return LearningQuizTypeEntity.rearrange;
      case LearningQuizTypeRM.matching:
        return LearningQuizTypeEntity.matching;
      case LearningQuizTypeRM.assignment:
        return LearningQuizTypeEntity.assignment;
      default:
        return LearningQuizTypeEntity.unknown;
    }
  }
}
