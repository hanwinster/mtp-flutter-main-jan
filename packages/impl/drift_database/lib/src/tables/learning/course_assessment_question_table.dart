import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('CourseAssessmentQuestionEntry')
class CourseAssessmentQuestionTable extends Table {
  @override
  String? get tableName => 'course_assessment_questions';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get courseId => text()();

  TextColumn get question => text()();

  TextColumn get options => text().map(const StringListConverter())();

  TextColumn get correctAnswers => text().map(const StringListConverter())();

  IntColumn get order => integer()();

  TextColumn get type => text().map(const AssessmentQuestionTypeConverter())();

  TextColumn get passingOption => text().map(const AssessmentQuestionPassingOptionConverter())();

  TextColumn get userAnswer => text().map(const AssessmentUserAnswerConverter()).nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
