import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class AssessmentQuestionPassingOptionConverter
    extends TypeConverter<AssessmentQuestionPassingOptionEntity, String> {
  const AssessmentQuestionPassingOptionConverter();

  @override
  AssessmentQuestionPassingOptionEntity fromSql(String fromDb) {
    return AssessmentQuestionPassingOptionEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(AssessmentQuestionPassingOptionEntity value) {
    return jsonEncode(value.toJson());
  }
}
