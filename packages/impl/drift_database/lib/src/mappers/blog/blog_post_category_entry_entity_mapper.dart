import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension BlogPostCategoryEntryEntityMapper on BlogPostCategoryEntry {
  BlogPostCategoryEntity toEntity() {
    return BlogPostCategoryEntity(
      id: id,
      name: name,
    );
  }
}