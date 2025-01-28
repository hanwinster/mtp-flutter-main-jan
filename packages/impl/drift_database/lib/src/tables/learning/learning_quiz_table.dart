import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('LearningQuizEntry')
class LearningQuizTable extends Table {
  @override
  String? get tableName => 'learning_quizzes';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get lectureId => text()();

  TextColumn get courseId => text()();

  TextColumn get type => text().map(const LearningQuizTypeConverter())();

  BoolColumn get isTryAgain => boolean()();

  TextColumn get questions =>
      text().map(const LearningQuizQuestionListConverter())();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
