import 'package:api/api.dart';
import 'package:data/src/mappers/learning/learning_quiz_matching_pair_rm_entity_mapper.dart';
import 'package:database/database.dart';

import '../mappers.dart';

extension LearningQuizMatchingAnswerRMEntityMapper
    on LearningQuizMatchingAnswerRM {
  LearningQuizMatchingAnswerEntity toEntity() {
    return LearningQuizMatchingAnswerEntity(
      id: id?.toString() ?? '',
      pairs: answers?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
