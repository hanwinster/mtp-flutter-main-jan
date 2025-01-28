import 'package:drift/drift.dart';

@DataClassName('CourseCategoryEntry')
class CourseCategoryTable extends Table {
  @override
  String? get tableName => 'course_categories';

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get name => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
