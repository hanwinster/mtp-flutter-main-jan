import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension CourseCategoryEntryEntityMapper on CourseCategoryEntry {
  CourseCategoryEntity toEntity() {
    return CourseCategoryEntity(
      id: id,
      name: name,
    );
  }
}