import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/drift_database.dart';
import 'package:drift_database/src/queries/queries.dart';

import '../../mappers/mappers.dart';
import '../../tables/tables.dart';

part 'drift_offline_course_dao.g.dart';

@DriftAccessor(tables: [
  CourseLearnerTable,
  UserCourseTable,
  CourseTable,
  LectureTable,
  LearningActivityTable,
  LearningSummaryTable,
  LearningQuizTable,
  LiveSessionTable,
  CourseAssessmentQuestionTable,
  OfflineCourseTable,
])
class DriftOfflineCourseDao extends DatabaseAccessor<DriftMtpDatabase>
    with _$DriftOfflineCourseDaoMixin
    implements OfflineCourseDao {
  DriftOfflineCourseDao(super.db);

  @override
  Stream<List<OfflineCourseEntity>> observeEntities() {
    return select(offlineCourseTable)
        .join([
          innerJoin(
            courseTable,
            courseTable.id.equalsExp(offlineCourseTable.courseId),
          ),
        ])
        .watch()
        .map(
          (rows) => rows.map(
            (row) {
              final course = row.readTable(courseTable).toEntity(
                courseLearner: null,
                lectures: [],
                learningActivities: [],
                summaries: [],
                quizzes: [],
                assessmentQuestions: [],
                liveSessions: [],
              );
              return row.readTable(offlineCourseTable).toEntity(course: course);
            },
          ).toList(),
        );
  }

  @override
  Future<void> upsertEntity({
    required OfflineCourseEntity entity,
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
      entity: entity.course,
    );
    await into(offlineCourseTable).insertOnConflictUpdate(
      OfflineCourseTableCompanion.insert(
        courseId: entity.course.id,
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> deleteEntity({
    required String courseId,
  }) async {
    await (delete(offlineCourseTable)
          ..where(
            (tbl) => tbl.courseId.equals(courseId),
          ))
        .go();
  }
}
