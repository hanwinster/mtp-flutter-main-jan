import 'package:api/api.dart';
import 'package:database/database.dart';

extension LearningQuizShortQuestionAnswerRMEntityMapper
    on LearningQuizShortQuestionAnswerRM {
  LearningQuizShortQuestionAnswerEntity toEntity() {
    return LearningQuizShortQuestionAnswerEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      answer: answer ?? '',
      userAnswer: userAnswer ?? '',
    );
  }
}
