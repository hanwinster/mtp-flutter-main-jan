import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension OfflineCourseMediaEntryEntityMapper on OfflineCourseMediaEntry {
  OfflineCourseMediaEntity toEntity() {
    return OfflineCourseMediaEntity(
      id: id.toString(),
      courseId: courseId,
      url: url,
      title: title,
      thumbnail: thumbnail ?? '',
    );
  }
}
