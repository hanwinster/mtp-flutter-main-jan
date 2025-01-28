import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('LearningSummaryEntry')
class LearningSummaryTable extends Table {
  @override
  String? get tableName => 'learning_summaries';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get media => text().map(const MediaConverter()).nullable()();

  TextColumn get lectureId => text()();

  TextColumn get courseId => text()();

  TextColumn get interactiveFeatures =>
      text().map(const InteractiveFeaturesListConverter())();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
