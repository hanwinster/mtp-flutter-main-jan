import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class MediaConverter extends TypeConverter<MediaEntity, String> {
  const MediaConverter();

  @override
  MediaEntity fromSql(String fromDb) {
    return MediaEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(MediaEntity value) {
    return jsonEncode(value.toJson());
  }
}
