import 'package:drift/drift.dart';

@DataClassName('CourseDownloadStatusEntry')
class CourseDownloadStatusTable extends Table {
  @override
  String? get tableName => 'course_download_status';

  @override
  Set<Column> get primaryKey => {courseId};

  TextColumn get courseId => text()();

  TextColumn get downloadTaskId => text()();

  TextColumn get downloadRecordJson => text()();

  BoolColumn get isHandled => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
