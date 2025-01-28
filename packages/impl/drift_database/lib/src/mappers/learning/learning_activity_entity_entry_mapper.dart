import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LearningActivityEntityEntryMapper on LearningActivityEntity {
  LearningActivityEntry toEntry() {
    return LearningActivityEntry(
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
