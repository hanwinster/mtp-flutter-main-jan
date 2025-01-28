import 'package:api/api.dart';
import 'package:database/database.dart';


extension LearningQuizMatchingPairRMEntityMapper
    on LearningQuizMatchingPairRM {
  LearningQuizMatchingPairEntity toEntity() {
    return LearningQuizMatchingPairEntity(
      questionLabel: questionLabel ?? "",
      questionText: questionText ?? "",
      answerLabel: answerLabel ?? "",
      answerText: answerText ?? "",
    );
  }
}
