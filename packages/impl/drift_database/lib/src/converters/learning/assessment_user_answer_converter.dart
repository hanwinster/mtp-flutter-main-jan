import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class AssessmentUserAnswerConverter extends TypeConverter<AssessmentUserAnswerEntity, String> {
  const AssessmentUserAnswerConverter();

  @override
  AssessmentUserAnswerEntity fromSql(String fromDb) {
    return AssessmentUserAnswerEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(AssessmentUserAnswerEntity value) {
    return jsonEncode(value.toJson());
  }
}
