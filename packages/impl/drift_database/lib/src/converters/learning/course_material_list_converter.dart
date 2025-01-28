import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseMaterialListConverter extends TypeConverter<List<CourseMaterialEntity>, String> {
  const CourseMaterialListConverter();

  @override
  List<CourseMaterialEntity> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => CourseMaterialEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<CourseMaterialEntity> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
