import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class LearningQuizTypeConverter extends TypeConverter<LearningQuizTypeEntity, String> {
  const LearningQuizTypeConverter();

  @override
  LearningQuizTypeEntity fromSql(String fromDb) {
    return LearningQuizTypeEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(LearningQuizTypeEntity value) {
    return jsonEncode(value.toJson());
  }
}
