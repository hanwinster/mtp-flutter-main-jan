import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LectureEntityEntryMapper on LectureEntity {
  LectureEntry toEntry() {
    return LectureEntry(
      id: id,
      title: title,
      resourceUrl: resourceUrl,
      description: description,
      resourceType: resourceType,
      videoUrl: videoUrl,
      attachedFileUrl: attachedFileUrl,
      courseId: courseId,
      media: media,
      interactiveFeatures: interactiveFeatures,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: null,
    );
  }
}