import 'package:drift/drift.dart';

@DataClassName('OfflineCourseEntry')
class OfflineCourseTable extends Table {
  @override
  String? get tableName => 'offline_courses';

  @override
  Set<Column> get primaryKey => {courseId};

  TextColumn get courseId => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
