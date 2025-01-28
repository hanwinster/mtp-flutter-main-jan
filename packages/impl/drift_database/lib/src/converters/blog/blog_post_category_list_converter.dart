import 'dart:convert';

import 'package:database/database.dart';
import 'package:drift/drift.dart';

class BlogPostCategoryListConverter extends TypeConverter<List<BlogPostCategoryEntity>, String> {
  const BlogPostCategoryListConverter();

  @override
  List<BlogPostCategoryEntity> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return [];
    }
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => BlogPostCategoryEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<BlogPostCategoryEntity> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
