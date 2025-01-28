import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class ReactionListConverter extends TypeConverter<List<ReactionEntity>, String> {
  const ReactionListConverter();

  @override
  List<ReactionEntity> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => ReactionEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<ReactionEntity> value) {
    return jsonEncode(value);
  }
}
