import 'package:api/api.dart';
import 'package:database/database.dart';


extension LearningQuizRearrangeAnswerRMEntityMapper
    on LearningQuizRearrangeAnswerRM {
  LearningQuizRearrangeAnswerEntity toEntity() {
    return LearningQuizRearrangeAnswerEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      options: List.from(options ?? []),
      correctOrder: List.from(options ?? []),
    );
  }
}
