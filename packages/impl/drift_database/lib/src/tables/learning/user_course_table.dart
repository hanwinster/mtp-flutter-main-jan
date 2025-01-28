import 'package:drift/drift.dart';

@DataClassName('UserCourseEntry')
class UserCourseTable extends Table {
  @override
  String? get tableName => 'user_courses';

  @override
  Set<Column> get primaryKey => {courseId, learnerId};

  TextColumn get courseId => text()();

  TextColumn get learnerId => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
