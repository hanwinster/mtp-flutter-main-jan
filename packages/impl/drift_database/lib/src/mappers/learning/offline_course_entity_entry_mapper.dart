import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension OfflineCourseEntityEntryMapper on OfflineCourseEntity {
  OfflineCourseEntry toEntry() {
    return OfflineCourseEntry(
      courseId: course.id,
      createdAt: DateTime.now(),
      updatedAt: null,
      deletedAt: null,
    );
  }
}