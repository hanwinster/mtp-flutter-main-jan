import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension CourseDownloadStatusEntryEntityMapper on CourseDownloadStatusEntry {
  CourseDownloadStatusEntity toEntity() {
    return CourseDownloadStatusEntity(
      courseId: courseId,
      downloadTaskId: downloadTaskId,
      downloadRecordJson: downloadRecordJson,
      isHandled: isHandled,
    );
  }
}
