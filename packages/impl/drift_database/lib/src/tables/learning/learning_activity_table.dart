import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('LearningActivityEntry')
class LearningActivityTable extends Table {
  @override
  String? get tableName => 'learning_activities';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get media => text().map(const MediaConverter()).nullable()();

  TextColumn get courseId => text()();

  TextColumn get lectureId => text()();

  TextColumn get interactiveFeatures =>
      text().map(const InteractiveFeaturesListConverter())();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
