import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LearningActivityEntryEntityMapper on LearningActivityEntry {
  LearningActivityEntity toEntity() {
    return LearningActivityEntity(
      id: id,
      title: title,
      description: description,
      courseId: courseId,
      lectureId: lectureId,
      interactiveFeatures: interactiveFeatures,
      media: media,
    );
  }
}
