import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class AssessmentQuestionTypeConverter extends TypeConverter<AssessmentQuestionTypeEntity, String> {
  const AssessmentQuestionTypeConverter();

  @override
  AssessmentQuestionTypeEntity fromSql(String fromDb) {
    return AssessmentQuestionTypeEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(AssessmentQuestionTypeEntity value) {
    return jsonEncode(value.toJson());
  }
}
