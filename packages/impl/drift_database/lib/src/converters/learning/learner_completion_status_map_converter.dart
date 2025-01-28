import 'dart:convert';

import 'package:drift/drift.dart';

class LearnerCompletionStatusMapConverter extends TypeConverter<Map<String, bool>, String> {
  const LearnerCompletionStatusMapConverter();

  @override
  Map<String, bool> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return {};
    }

    final Map<String, dynamic> jsonMap = jsonDecode(fromDb) as Map<String, dynamic>;
    return jsonMap.map((key, value) => MapEntry(key, value as bool));
  }

  @override
  String toSql(Map<String, bool> value) {
    if (value.isEmpty) {
      return '';
    }

    return jsonEncode(value);
  }
}
