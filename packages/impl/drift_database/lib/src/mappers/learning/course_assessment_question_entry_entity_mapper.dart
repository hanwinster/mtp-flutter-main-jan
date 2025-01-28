import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension CourseAssessmentQuestionEntryEntityMapper on CourseAssessmentQuestionEntry {
  AssessmentQuestionEntity toEntity() {
    return AssessmentQuestionEntity(
      id: id,
      courseId: courseId,
      question: question,
      options: options,
      correctAnswers: correctAnswers,
      order: order,
      type: type,
      passingOption: passingOption,
      userAnswer: userAnswer,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
