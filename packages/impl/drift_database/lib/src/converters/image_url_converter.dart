import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class ImageUrlConverter extends TypeConverter<ImageUrlEntity, String> {
  const ImageUrlConverter();

  @override
  ImageUrlEntity fromSql(String fromDb) {
    return ImageUrlEntity.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(ImageUrlEntity value) {
    return jsonEncode(value.toJson());
  }
}
