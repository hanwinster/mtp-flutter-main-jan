import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LearningSummaryEntityEntryMapper on LearningSummaryEntity {
  LearningSummaryEntry toEntry() {
    return LearningSummaryEntry(
      id: id,
      title: title,
      description: description,
      courseId: courseId,
      lectureId: lectureId,
      interactiveFeatures: interactiveFeatures,
      media: media,
      createdAt: DateTime.now(),
      updatedAt: null,
      deletedAt: null,
    );
  }
}
