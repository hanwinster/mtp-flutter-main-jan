import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

extension OfflineCourseMediaEntityEntryMapper on OfflineCourseMediaEntity {
  OfflineCourseMediaTableCompanion toCompanion() {
    return OfflineCourseMediaTableCompanion.insert(
      courseId: courseId,
      url: url,
      title: title,
      thumbnail: Value(thumbnail),
      createdAt: DateTime.now(),
    );
  }
}
