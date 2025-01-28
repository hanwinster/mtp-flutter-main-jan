import 'package:api/api.dart';
import 'package:database/database.dart';


extension LearningQuizLongQuestionAnswerRMEntityMapper
    on LearningQuizLongQuestionAnswerRM {
  LearningQuizLongQuestionAnswerEntity toEntity() {
    return LearningQuizLongQuestionAnswerEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      answer: answer ?? '',
      userAnswer: userAnswer ?? '',
    );
  }
}
