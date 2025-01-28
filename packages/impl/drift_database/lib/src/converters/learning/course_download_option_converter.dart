import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class CourseDownloadOptionConverter extends TypeConverter<CourseDownloadableOptionEntity, String> {
  const CourseDownloadOptionConverter();

  @override
  CourseDownloadableOptionEntity fromSql(String fromDb) {
    return CourseDownloadableOptionEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(CourseDownloadableOptionEntity value) {
    return jsonEncode(value.toJson());
  }
}
