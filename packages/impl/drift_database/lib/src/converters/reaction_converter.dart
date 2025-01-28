import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class ReactionConverter extends TypeConverter<ReactionEntity, String> {
  const ReactionConverter();

  @override
  ReactionEntity fromSql(String fromDb) {
    return ReactionEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(ReactionEntity value) {
    return jsonEncode(value.toJson());
  }
}
