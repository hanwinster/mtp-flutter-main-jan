import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension AssessmentQuestionEntityEntryMapper on AssessmentQuestionEntity {
  CourseAssessmentQuestionEntry toEntry() {
    return CourseAssessmentQuestionEntry(
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
