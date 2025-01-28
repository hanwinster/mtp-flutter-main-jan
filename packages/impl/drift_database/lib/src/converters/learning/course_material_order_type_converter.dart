import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseMaterialOrderTypeConverter extends TypeConverter<CourseMaterialOrderTypeEntity, String> {
  const CourseMaterialOrderTypeConverter();

  @override
  CourseMaterialOrderTypeEntity fromSql(String fromDb) {
    return CourseMaterialOrderTypeEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(CourseMaterialOrderTypeEntity value) {
    return jsonEncode(value.toJson());
  }
}
