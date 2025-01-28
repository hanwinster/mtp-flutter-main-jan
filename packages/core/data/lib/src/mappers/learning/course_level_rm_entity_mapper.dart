import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseLevelRMEntityMapper on CourseLevelRM {
  CourseLevelEntity toEntity() {
    return CourseLevelEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      name: name ?? '',
      value: value ?? '',
    );
  }
}
