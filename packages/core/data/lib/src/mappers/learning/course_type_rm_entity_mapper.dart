import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseTypeRMEntityMapper on CourseTypeRM {
  CourseTypeEntity toEntity() {
    return CourseTypeEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      name: name ?? '',
    );
  }
}
