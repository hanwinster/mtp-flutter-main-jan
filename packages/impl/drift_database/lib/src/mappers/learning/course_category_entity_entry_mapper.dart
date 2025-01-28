import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

extension CourseCategoryEntityEntryMapper on CourseCategoryEntity {
  CourseCategoryEntry toEntry() {
    return CourseCategoryEntry(
      id: id,
      name: name,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  CourseCategoryTableCompanion toCompanion() {
    return CourseCategoryTableCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
  }
}