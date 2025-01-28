import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('BlogPostQueryEntry')
class BlogPostQueryTable extends Table {
  @override
  String? get tableName => 'blog_post_queries';

  @override
  Set<Column> get primaryKey => {query};

  TextColumn get query => text()();

  TextColumn get ids => text().map(const StringListConverter())();
}
