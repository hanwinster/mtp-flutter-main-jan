import 'package:drift/drift.dart';

@DataClassName('OfflineCourseMediaEntry')
class OfflineCourseMediaTable extends Table {
  @override
  String? get tableName => 'offline_course_media';

  @override
  List<Set<Column>> get uniqueKeys => [
        {courseId, url},
      ];

  IntColumn get id => integer().autoIncrement()();

  TextColumn get courseId => text()();

  TextColumn get url => text()();

  TextColumn get title => text()();

  TextColumn get thumbnail => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
