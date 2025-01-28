
import 'package:database/database.dart';
import 'package:drift/drift.dart';

class BlogPostDurationUnitConverter extends TypeConverter<BlogPostDurationUnitEntity, String> {
  const BlogPostDurationUnitConverter();

  @override
  BlogPostDurationUnitEntity fromSql(String fromDb) {
    return BlogPostDurationUnitEntity.fromJson(fromDb);
  }

  @override
  String toSql(BlogPostDurationUnitEntity value) {
    return value.toJson();
  }
}
