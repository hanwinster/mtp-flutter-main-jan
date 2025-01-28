import 'package:drift/drift.dart';

@DataClassName('BlogPostCategoryEntry')
class BlogPostCategoryTable extends Table {
  @override
  String? get tableName => 'blog_post_categories';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get name => text()();

  BoolColumn get active => boolean()();

  IntColumn get numberOfArticles => integer()();

  IntColumn get numberOfPublicArticles => integer()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
