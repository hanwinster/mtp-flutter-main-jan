import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LearningSummaryEntryEntityMapper on LearningSummaryEntry {
  LearningSummaryEntity toEntity() {
    return LearningSummaryEntity(
      id: id,
      title: title,
      description: description,
      media: media,
      courseId: courseId,
      lectureId: lectureId,
      interactiveFeatures: interactiveFeatures,
    );
  }
}
