import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class NullableReactionConverter extends TypeConverter<ReactionEntity?, String?> {
  const NullableReactionConverter();

  @override
  ReactionEntity? fromSql(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return ReactionEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String? toSql(ReactionEntity? value) {
    if (value == null) {
      return null;
    }
    return jsonEncode(value.toJson());
  }
}
