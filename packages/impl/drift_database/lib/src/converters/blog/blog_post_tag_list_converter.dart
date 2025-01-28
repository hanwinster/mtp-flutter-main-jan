import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class BlogPostTagListConverter extends TypeConverter<List<BlogPostTagEntity>, String> {
  const BlogPostTagListConverter();

  @override
  List<BlogPostTagEntity> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => BlogPostTagEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<BlogPostTagEntity> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
