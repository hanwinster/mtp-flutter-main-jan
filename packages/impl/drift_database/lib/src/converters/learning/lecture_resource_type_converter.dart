import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class LectureResourceTypeConverter extends TypeConverter<LectureResourceTypeEntity, String> {
  const LectureResourceTypeConverter();

  @override
  LectureResourceTypeEntity fromSql(String fromDb) {
    return LectureResourceTypeEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(LectureResourceTypeEntity value) {
    return jsonEncode(value.toJson());
  }
}
