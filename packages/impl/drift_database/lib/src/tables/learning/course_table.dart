import 'package:drift/drift.dart';

import '../../converters/converters.dart';

@DataClassName('CourseEntry')
class CourseTable extends Table {
  @override
  String? get tableName => 'courses';

  @override
  Set<Column>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get objective => text()();

  TextColumn get learningOutcome => text()();

  TextColumn get coverImage => text().map(const ImageUrlConverter())();

  TextColumn get urlLink => text()();

  BoolColumn get isDisplayVideo => boolean()();

  TextColumn get videoUrl => text()();

  TextColumn get categories =>
      text().map(const CourseCategoryListConverter())();

  TextColumn get downloadableOption =>
      text().map(const CourseDownloadOptionConverter())();

  TextColumn get courseLevel => text().map(const CourseLevelConverter())();

  TextColumn get courseType => text().map(const CourseTypeConverter())();

  BoolColumn get isAllowFeedback => boolean()();

  BoolColumn get isAllowDiscussion => boolean()();

  TextColumn get discussion => text().map(const CourseDiscussionConverter()).nullable()();

  IntColumn get acceptableScoreForAssignment => integer()();

  IntColumn get acceptableScoreForAssessment => integer()();

  TextColumn get estimatedDuration =>
      text().map(const CourseDurationConverter())();

  IntColumn get numberOfEnrollments => integer()();

  IntColumn get totalLectures => integer()();

  IntColumn get totalQuizzes => integer()();

  IntColumn get viewCount => integer()();

  RealColumn get rating => real()();

  TextColumn get courseOrderType =>
      text().map(const CourseMaterialOrderTypeConverter())();

  TextColumn get lectureOrderType =>
      text().map(const CourseMaterialOrderTypeConverter())();

  TextColumn get courseOrder =>
      text().map(const CourseMaterialListConverter())();

  TextColumn get lectureOrderByLectureId =>
      text().map(const LectureOrderMapConverter())();

  TextColumn get evaluationMessage => text()();

  BoolColumn get isXApiCourse => boolean()();

  TextColumn get resourceFileUrl => text()();

  BoolColumn get hasUserTakenCourse => boolean()();

  BoolColumn get isUserCanAccessCourse => boolean()();

  TextColumn get createdBy => text().map(const UserConverter()).nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get deletedAt => dateTime().nullable()();
}
