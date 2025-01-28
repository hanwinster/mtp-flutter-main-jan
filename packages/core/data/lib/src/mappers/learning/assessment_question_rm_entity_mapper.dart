import 'package:api/api.dart';
import 'package:database/database.dart';

import 'assessment_question_passing_option_rm_entity_mapper.dart';
import 'assessment_question_type_rm_entity_mapper.dart';
import 'assessment_user_answer_rm_entity_mapper.dart';

extension AssessmentQuestionRMEntityMapper on AssessmentQuestionRM {
  AssessmentQuestionEntity toEntity() {
    return AssessmentQuestionEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      courseId: courseId?.toString() ?? '',
      question: question ?? '',
      type: type?.toEntity() ?? AssessmentQuestionTypeEntity.unknown,
      passingOption: passingOption?.toEntity() ?? AssessmentQuestionPassingOptionEntity.unknown,
      options: options?.map((e) => e.toString()).toList() ?? [],
      correctAnswers: correctAnswers?.map((e) => e.toString()).toList() ?? [],
      order: order ?? 0,
      userAnswer: userAnswers?.firstOrNull?.toEntity(),
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
      deletedAt: null,
    );
  }
}
