import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('BlogPostEntry')
class BlogPostTable extends Table {
  @override
  String? get tableName => 'blog_posts';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get slug => text()();

  TextColumn get title => text()();

  TextColumn get bodyUpper => text()();

  TextColumn get blockQuote => text()();

  TextColumn get bodyLower => text()();

  TextColumn get privacy => text()();

  IntColumn get viewCount => integer()();

  IntColumn get shareCount => integer()();

  TextColumn get shareLink => text()();

  IntColumn get duration => integer()();

  TextColumn get durationUnit =>
      text().map(const BlogPostDurationUnitConverter())();

  TextColumn get imageUrl => text().map(const ImageUrlConverter())();

  TextColumn get featuredVideo => text()();

  BoolColumn get isDisplayVideo => boolean()();

  TextColumn get videoLink => text()();

  TextColumn get author => text().map(const UserConverter()).nullable()();

  BoolColumn get hasRead => boolean()();

  IntColumn get numberOfReactions => integer()();

  IntColumn get numberOfComments => integer()();

  IntColumn get overallScore => integer()();

  BoolColumn get hasQuiz => boolean()();

  TextColumn get categories =>
      text().map(const BlogPostCategoryListConverter())();

  TextColumn get tags => text().map(const BlogPostTagListConverter())();

  TextColumn get currentReaction =>
      text().map(const NullableReactionConverter()).nullable()();

  TextColumn get postReactions => text().map(const ReactionListConverter())();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
