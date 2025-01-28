import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseDurationConverter extends TypeConverter<CourseDurationEntity, String> {
  const CourseDurationConverter();

  @override
  CourseDurationEntity fromSql(String fromDb) {
    return CourseDurationEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(CourseDurationEntity value) {
    return jsonEncode(value.toJson());
  }
}
