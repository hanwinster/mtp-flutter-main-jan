import 'dart:convert';

import 'package:drift/drift.dart';

class LectureOrderMapConverter extends TypeConverter<Map<String, List<String>>, String> {
  const LectureOrderMapConverter();

  @override
  Map<String, List<String>> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return {};
    }

    final Map<String, dynamic> jsonMap = jsonDecode(fromDb) as Map<String, dynamic>;
    return jsonMap.map((key, value) => MapEntry(
        key, (value as List<dynamic>).map((item) => item as String).toList()));
  }

  @override
  String toSql(Map<String, List<String>> value) {
    if (value.isEmpty) {
      return '';
    }

    return jsonEncode(value);
  }
}
