import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';

extension BlogPostCategoryEntityEntryMapper on BlogPostCategoryEntity {
  BlogPostCategoryEntry toEntry() {
    return BlogPostCategoryEntry(
      id: id,
      name: name,
      active: true,
      numberOfArticles: 0,
      numberOfPublicArticles: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  BlogPostCategoryTableCompanion toCompanion() {
    return BlogPostCategoryTableCompanion(
      id: Value(id),
      name: Value(name),
      active: const Value(true),
      numberOfArticles: const Value(0),
      numberOfPublicArticles: const Value(0),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
  }
}