import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:database/database.dart';

import '../mappers.dart';

extension LearningQuizFillInTheBlankAnswerRMEntityMapper
    on LearningQuizFillInTheBlankAnswerRM {
  LearningQuizFillInTheBlankAnswerEntity toEntity() {
    return LearningQuizFillInTheBlankAnswerEntity(
      id: id?.toString() ?? (throw Exception("id must not be null")),
      correctAnswers: paragraph
              ?.whereType<LearningQuizFillInTheBlankPartRM>()
              .map((e) => e.blank ?? '')
              .whereNot((e) => e.isEmpty)
              .toList() ??
          [],
      optionalKeywords: commaSeparatedOptionalKeywords
              ?.split(",")
              .map((e) => e.trim())
              .toList() ??
          [],
      parts: paragraph?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
