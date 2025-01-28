import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class LearningQuizQuestionListConverter extends TypeConverter<List<LearningQuizQuestionEntity>, String> {
  const LearningQuizQuestionListConverter();

  @override
  List<LearningQuizQuestionEntity> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => LearningQuizQuestionEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<LearningQuizQuestionEntity> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
