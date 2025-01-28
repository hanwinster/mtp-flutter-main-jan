import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('BlogPostCommentEntry')
class BlogPostCommentTable extends Table {

  @override
  String? get tableName => 'blog_post_comments';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get postId => text()();

  TextColumn get comment => text()();

  TextColumn get user => text().map(const UserConverter()).nullable()();

  TextColumn get currentReaction =>
      text().map(const NullableReactionConverter()).nullable()();

  TextColumn get imageUrl => text()();

  TextColumn get videoUrl => text()();

  IntColumn get replyCount => integer()();

  IntColumn get numberOfReactions => integer()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

}
