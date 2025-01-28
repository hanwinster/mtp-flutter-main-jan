import 'package:api/api.dart';
import 'package:database/database.dart';

extension BlogPostCategoryRMEntityMapper on BlogPostCategoryRM {
  BlogPostCategoryEntity toEntity() {
    return BlogPostCategoryEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      name: name ?? '',
    );
  }
}
