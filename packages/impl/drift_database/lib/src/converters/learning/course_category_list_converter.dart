import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseCategoryListConverter extends TypeConverter<List<CourseCategoryEntity>, String> {
  const CourseCategoryListConverter();

  @override
  List<CourseCategoryEntity> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => CourseCategoryEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<CourseCategoryEntity> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
