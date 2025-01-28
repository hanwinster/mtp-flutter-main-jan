import 'package:api/api.dart';
import 'package:database/database.dart';


extension LearningQuizMultipleChoiceAnswerRMEntityMapper
    on LearningQuizMultipleChoiceAnswerRM {
  LearningQuizMultipleChoiceAnswerEntity toEntity() {
    return LearningQuizMultipleChoiceAnswerEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      answerLabel: answerLabel ?? '',
      answerText: answerText ?? '',
      isCorrectAnswer: isCorrectAnswer == 1,
    );
  }
}
