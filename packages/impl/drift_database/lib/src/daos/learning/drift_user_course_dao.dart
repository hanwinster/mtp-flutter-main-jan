import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';
import 'package:drift_database/src/queries/queries.dart';
import 'package:rxdart/rxdart.dart';

import '../../converters/converters.dart';
import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_user_course_dao.g.dart';

@DriftAccessor(tables: [
  UserCourseTable,
  CourseLearnerTable,
  CourseTable,
  LectureTable,
  LearningActivityTable,
  LearningSummaryTable,
  LiveSessionTable,
  LearningQuizTable,
  CourseAssessmentQuestionTable,
])
class DriftUserCourseDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftUserCourseDaoMixin
    implements UserCourseDao {
  DriftUserCourseDao(super.db);

  @override
  Future<void> upsertEntities({
    required List<CourseEntity> entities,
  }) async {
    await batch((batch) async {
      for (final entity in entities) {
        await upsertEntity(entity: entity);
      }
    });
  }

  @override
  Future<void> insertOrIgnoreEntities({
    required List<CourseEntity> entities,
  }) async {
    for (final entity in entities) {
      await batch((batch) {
        if (entity.courseLearner != null) {
          final newCourseLearner = entity.courseLearner!.toEntry();
          batch.insert(
            courseLearnerTable,
            newCourseLearner,
            onConflict: DoUpdate(
              (_) => newCourseLearner,
            ),
          );

          final userCourseRow = UserCourseTableCompanion.insert(
            courseId: entity.id,
            learnerId: entity.courseLearner!.id,
            createdAt: DateTime.now(),
          );
          batch.insert(
            userCourseTable,
            userCourseRow,
            onConflict: DoUpdate(
              (_) => userCourseRow,
            ),
          );
        }
        final newCourse = entity.toEntry();
        batch.insert(
          courseTable,
          newCourse,
          mode: InsertMode.insertOrIgnore,
        );
      });
    }
  }

  @override
  Future<void> upsertEntity({
    required CourseEntity entity,
  }) async {
    await insertCourse(
      courseLearnerTable: courseLearnerTable,
      courseTable: courseTable,
      lectureTable: lectureTable,
      learningActivityTable: learningActivityTable,
      learningSummaryTable: learningSummaryTable,
      learningQuizTable: learningQuizTable,
      userCourseTable: userCourseTable,
      liveSessionTable: liveSessionTable,
      courseAssessmentQuestionTable: courseAssessmentQuestionTable,
      entity: entity,
    );
  }

  @override
  Future<List<String>> getCourseIds({
    required bool completed,
  }) async {
    final query = select(userCourseTable).join([
      leftOuterJoin(
        courseTable,
        courseTable.id.equalsExp(userCourseTable.courseId),
      ),
      leftOuterJoin(
        courseLearnerTable,
        courseLearnerTable.courseId.equalsExp(userCourseTable.courseId),
      ),
    ]);

    final serializedCompletedStatus = const CourseLearnerStatusConverter()
        .toSql(CourseLearnerStatusEntity.completed);
    if (completed) {
      query.where(courseLearnerTable.status.equals(serializedCompletedStatus));
    } else {
      query.where(
          courseLearnerTable.status.equals(serializedCompletedStatus).not());
    }

    final courseIds = await query.map((row) {
      return row.readTable(userCourseTable).courseId;
    }).get();

    return courseIds;
  }

  @override
  Future<CourseEntity?> getEntity({
    required String courseId,
  }) async {
    final courseQuery = select(courseTable)
      ..where((tbl) => tbl.id.equals(courseId));
    final courseEntry = await courseQuery.getSingleOrNull();
    return courseEntry?.toEntity(
      courseLearner: null,
      lectures: [],
      learningActivities: [],
      summaries: [],
      quizzes: [],
      liveSessions: [],
      assessmentQuestions: [],
    );
  }

  @override
  Stream<List<CourseEntity>> observeEntities({
    required bool completed,
  }) {
    final query = select(userCourseTable).join([
      leftOuterJoin(
        courseTable,
        courseTable.id.equalsExp(userCourseTable.courseId),
      ),
      leftOuterJoin(
        courseLearnerTable,
        courseLearnerTable.courseId.equalsExp(userCourseTable.courseId),
      ),
    ])
      ..orderBy([
        OrderingTerm(
          expression: courseLearnerTable.createdAt,
          mode: OrderingMode.desc,
        ),
      ]);

    final serializedCompletedStatus = const CourseLearnerStatusConverter()
        .toSql(CourseLearnerStatusEntity.completed);
    if (completed) {
      query.where(courseLearnerTable.status.equals(serializedCompletedStatus));
    } else {
      query.where(
          courseLearnerTable.status.equals(serializedCompletedStatus).not());
    }

    final stream = query.watch().map((rows) {
      return rows.map((row) {
        final course = row.readTable(courseTable);
        final courseLearner = row.readTable(courseLearnerTable);

        return course.toEntity(
          courseLearner: courseLearner.toEntity(),
          lectures: const [],
          learningActivities: const [],
          summaries: const [],
          quizzes: const [],
          liveSessions: const [],
          assessmentQuestions: const [],
        );
      }).toList();
    });

    return stream;
  }

  @override
  Stream<CourseEntity?> observeEntity({
    required String id,
  }) {
    final courseQuery = select(courseTable)..where((tbl) => tbl.id.equals(id));
    final courseStream = courseQuery.watchSingleOrNull();

    final learnerQuery = select(courseLearnerTable)
      ..where((tbl) => tbl.courseId.equals(id));
    final learnerStream = learnerQuery.watchSingleOrNull();

    final lecturesQuery = select(lectureTable)
      ..where((tbl) => tbl.courseId.equals(id));
    final lecturesStream = lecturesQuery.watch();

    final learningActivitiesQuery = select(learningActivityTable)
      ..where((tbl) => tbl.courseId.equals(id));
    final learningActivitiesStream = learningActivitiesQuery.watch();

    final learningSummariesQuery = select(learningSummaryTable)
      ..where((tbl) => tbl.courseId.equals(id));
    final learningSummariesStream = learningSummariesQuery.watch();

    final learningQuizzesQuery = select(learningQuizTable)
      ..where((tbl) => tbl.courseId.equals(id));
    final learningQuizzesStream = learningQuizzesQuery.watch();

    final liveSessionsQuery = select(liveSessionTable)
      ..where((tbl) => tbl.courseId.equals(id));
    final liveSessionsStream = liveSessionsQuery.watch();

    final assessmentQuestionsQuery = select(courseAssessmentQuestionTable)
      ..where((tbl) => tbl.courseId.equals(id));
    final assessmentQuestionsStream = assessmentQuestionsQuery.watch();

    return Rx.combineLatest8(
      courseStream,
      learnerStream,
      lecturesStream,
      learningActivitiesStream,
      learningSummariesStream,
      learningQuizzesStream,
      liveSessionsStream,
      assessmentQuestionsStream,
      (
        courseRow,
        learner,
        lectures,
        learningActivities,
        learningSummaries,
        learningQuizzes,
        liveSessions,
        assessmentQuestions,
      ) {
        if (courseRow == null) {
          return null;
        }

        final learningActivityEntities = learningActivities.map((e) {
          return e.toEntity();
        }).toList();
        final summaryEntities = learningSummaries.map((e) {
          return e.toEntity();
        }).toList();

        final courseEntity = courseRow.toEntity(
          courseLearner: learner?.toEntity(),
          lectures: lectures
              .map((e) => e.toEntity(
                    learningActivities: learningActivityEntities
                        .where((element) => element.lectureId == e.id)
                        .toList(),
                    summaries: summaryEntities
                        .where((element) => element.lectureId == e.id)
                        .toList(),
                    quizzes: learningQuizzes
                        .where((element) => element.lectureId == e.id)
                        .map((e) => e.toEntity())
                        .toList(),
                    liveSessions: liveSessions
                        .where((element) => element.lectureId == e.id)
                        .map((e) => e.toEntity())
                        .toList(),
                  ))
              .toList(),
          learningActivities: learningActivityEntities
              .where((element) => element.lectureId.isEmpty)
              .toList(),
          summaries: summaryEntities
              .where((element) => element.lectureId.isEmpty)
              .toList(),
          quizzes: learningQuizzes
              .where((element) => element.lectureId.isEmpty)
              .map((e) => e.toEntity())
              .toList(),
          liveSessions: liveSessions
              .where((element) => element.lectureId.isEmpty)
              .map((e) => e.toEntity())
              .toList(),
          assessmentQuestions:
              assessmentQuestions.map((e) => e.toEntity()).toList(),
        );
        return courseEntity;
      },
    );
  }

  @override
  Future<void> deleteEntity({
    required String courseId,
  }) async {
    await (delete(userCourseTable)
          ..where((tbl) => tbl.courseId.equals(courseId)))
        .go();
    await (delete(courseLearnerTable)
          ..where((tbl) => tbl.courseId.equals(courseId)))
        .go();
  }

  @override
  Future<void> deleteEntities({
    required List<String> courseIds,
  }) async {
    await (delete(userCourseTable)
          ..where((tbl) => tbl.courseId.isIn(courseIds)))
        .go();
    await (delete(courseLearnerTable)
          ..where((tbl) => tbl.courseId.isIn(courseIds)))
        .go();
  }

  @override
  Future<void> deleteEntitiesByStatus({
    required bool completed,
  }) async {
    final serializedCompletedStatus = const CourseLearnerStatusConverter()
        .toSql(CourseLearnerStatusEntity.completed);
    if (completed) {
      final courseLearners = await (select(courseLearnerTable)
            ..where((tbl) => tbl.status.equals(serializedCompletedStatus)))
          .get();
      final courseLearnerIds = courseLearners.map((e) => e.id).toList();
      await (delete(userCourseTable)
            ..where((tbl) => tbl.learnerId.isIn(courseLearnerIds)))
          .go();
      await (delete(courseLearnerTable)
            ..where((tbl) => tbl.id.isIn(courseLearnerIds)))
          .go();
    } else {
      final courseLearners = await (select(courseLearnerTable)
            ..where(
                (tbl) => tbl.status.equals(serializedCompletedStatus).not()))
          .get();
      final courseLearnerIds = courseLearners.map((e) => e.id).toList();
      await (delete(userCourseTable)
            ..where((tbl) => tbl.learnerId.isIn(courseLearnerIds)))
          .go();
      await (delete(courseLearnerTable)
            ..where((tbl) => tbl.id.isIn(courseLearnerIds)))
          .go();
    }
  }

  @override
  Future<void> deleteAllEntities() async {
    await (delete(userCourseTable)).go();
    await (delete(courseLearnerTable)).go();
  }
}
