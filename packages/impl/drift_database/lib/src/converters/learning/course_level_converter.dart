import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseLevelConverter extends TypeConverter<CourseLevelEntity, String> {
  const CourseLevelConverter();

  @override
  CourseLevelEntity fromSql(String fromDb) {
    return CourseLevelEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(CourseLevelEntity value) {
    return jsonEncode(value.toJson());
  }
}
