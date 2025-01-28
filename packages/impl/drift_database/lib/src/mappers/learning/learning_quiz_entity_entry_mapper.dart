import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LearningQuizEntityEntryMapper on LearningQuizEntity {
  LearningQuizTableCompanion toCompanion() {
    return LearningQuizTableCompanion.insert(
      id: id,
      title: title,
      lectureId: lectureId,
      courseId: courseId,
      type: type,
      isTryAgain: isTryAgain,
      questions: questions,
      createdAt: DateTime.now(),
    );
  }
}
