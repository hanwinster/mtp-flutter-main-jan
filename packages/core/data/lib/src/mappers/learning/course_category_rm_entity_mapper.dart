import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseCategoryRMEntityMapper on CourseCategoryRM {
  CourseCategoryEntity toEntity() {
    return CourseCategoryEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      name: name ?? '',
    );
  }
}
