import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension CourseDownloadStatusEntityEntryMapper on CourseDownloadStatusEntity {
  CourseDownloadStatusEntry toEntry() {
    return CourseDownloadStatusEntry(
      courseId: courseId,
      downloadTaskId: downloadTaskId,
      downloadRecordJson: downloadRecordJson,
      isHandled: isHandled,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: null,
    );
  }
}