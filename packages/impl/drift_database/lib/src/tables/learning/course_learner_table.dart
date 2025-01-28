import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('CourseLearnerEntry')
class CourseLearnerTable extends Table {
  @override
  String? get tableName => 'course_learners';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get courseId => text()();

  TextColumn get userId => text()();

  TextColumn get status => text().map(const CourseLearnerStatusConverter())();

  IntColumn get percentage => integer().nullable()();

  IntColumn get notifyCount => integer()();

  BoolColumn get isActive => boolean()();

  TextColumn get completionStatusByMaterialKey => text().map(const LearnerCompletionStatusMapConverter())();

  BoolColumn get isReadyToEvaluate => boolean()();

  BoolColumn get isReadyToGenerateCertificate => boolean()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
