import 'package:api/api.dart';
import 'package:database/database.dart';


extension LearningQuizTrueFalseAnswerRMEntityMapper
    on LearningQuizTrueFalseAnswerRM {
  LearningQuizTrueFalseAnswerEntity toEntity() {
    return LearningQuizTrueFalseAnswerEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      answer: answer?.toLowerCase() == 'true',
    );
  }
}
