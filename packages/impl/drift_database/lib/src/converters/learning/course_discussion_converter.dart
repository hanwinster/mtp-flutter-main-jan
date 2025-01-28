import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseDiscussionConverter extends TypeConverter<CourseDiscussionEntity, String> {
  const CourseDiscussionConverter();

  @override
  CourseDiscussionEntity fromSql(String fromDb) {
    return CourseDiscussionEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(CourseDiscussionEntity value) {
    return jsonEncode(value.toJson());
  }
}
