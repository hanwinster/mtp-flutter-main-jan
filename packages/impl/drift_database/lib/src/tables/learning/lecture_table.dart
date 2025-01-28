import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('LectureEntry')
class LectureTable extends Table {

  @override
  String? get tableName => 'lectures';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get resourceUrl => text()();

  TextColumn get description => text()();

  TextColumn get resourceType => text().map(const LectureResourceTypeConverter())();

  TextColumn get videoUrl => text()();

  TextColumn get attachedFileUrl => text()();

  TextColumn get courseId => text()();

  TextColumn get media => text().map(const MediaConverter()).nullable()();

  TextColumn get interactiveFeatures => text().map(const InteractiveFeaturesListConverter())();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
