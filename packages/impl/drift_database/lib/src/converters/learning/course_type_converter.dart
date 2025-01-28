import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseTypeConverter extends TypeConverter<CourseTypeEntity, String> {
  const CourseTypeConverter();

  @override
  CourseTypeEntity fromSql(String fromDb) {
    return CourseTypeEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(CourseTypeEntity value) {
    return jsonEncode(value.toJson());
  }
}
