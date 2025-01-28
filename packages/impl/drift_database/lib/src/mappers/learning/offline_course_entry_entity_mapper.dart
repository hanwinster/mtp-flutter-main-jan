import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension OfflineCourseEntryEntityMapper on OfflineCourseEntry {
  OfflineCourseEntity toEntity({
    required CourseEntity course,
  }) {
    return OfflineCourseEntity(
      course: course,
    );
  }
}
