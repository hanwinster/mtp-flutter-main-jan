import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LearningQuizEntryEntityMapper on LearningQuizEntry {
  LearningQuizEntity toEntity() {
    return LearningQuizEntity(
      id: id,
      title: title,
      courseId: courseId,
      lectureId: lectureId,
      type: type,
      isTryAgain: isTryAgain,
      questions: questions,
    );
  }
}
