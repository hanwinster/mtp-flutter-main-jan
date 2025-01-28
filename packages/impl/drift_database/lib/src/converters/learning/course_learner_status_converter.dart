import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseLearnerStatusConverter extends TypeConverter<CourseLearnerStatusEntity, String> {
  const CourseLearnerStatusConverter();

  @override
  CourseLearnerStatusEntity fromSql(String fromDb) {
    return CourseLearnerStatusEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(CourseLearnerStatusEntity value) {
    return jsonEncode(value.toJson());
  }
}
