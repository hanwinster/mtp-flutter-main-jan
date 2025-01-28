import 'package:database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift_database/src/schema_versions.dart';

import 'converters/converters.dart';
import 'daos/daos.dart';
import 'tables/tables.dart';

part 'drift_mtp_database.g.dart';

@DriftDatabase(
  tables: [
    BlogPostTable,
    BlogPostQueryTable,
    BlogPostCommentTable,
    BlogPostCategoryTable,
    CourseAssessmentQuestionTable,
    CourseCategoryTable,
    CourseTable,
    CourseLearnerTable,
    OfflineCourseTable,
    OfflineCourseMediaTable,
    CourseDownloadStatusTable,
    LectureTable,
    LearningActivityTable,
    LearningSummaryTable,
    LearningQuizTable,
    UserCourseTable,
    LiveSessionTable,
  ],
  daos: [
    DriftBlogPostDao,
    DriftBlogPostCommentDao,
    DriftBlogPostCategoryDao,
    DriftCourseCategoryDao,
    DriftCourseLearnerDao,
    DriftOfflineCourseDao,
    DriftOfflineCourseMediaDao,
    DriftUserCourseDao,
    DriftLectureDao,
    DriftLearningActivityDao,
    DriftLearningSummaryDao,
    DriftCourseDownloadStatusDao,
    DriftLearningQuizDao,
    DriftCourseAssessmentQuestionDao,
    DriftLiveSessionDao,
  ],
)
class DriftMtpDatabase extends _$DriftMtpDatabase implements MtpDatabase {
  DriftMtpDatabase(super.e);

  static const latestSchemaVersion = 2;

  @override
  int get schemaVersion => latestSchemaVersion;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (migrator, from, to) async {
        await customStatement('PRAGMA foreign_keys = OFF');

        await migrator.runMigrationSteps(
          from: from,
          to: to,
          steps: migrationSteps(
            from1To2: (m, schema) async {
              await m.createTable(schema.liveSessions);
              await m.addColumn(schema.offlineCourseMedia, schema.offlineCourseMedia.thumbnail);
            },
          ),
        );
      },
    );
  }

  @override
  BlogPostDao get blogPostDao => driftBlogPostDao;

  @override
  BlogPostCategoryDao get blogPostCategoryDao => driftBlogPostCategoryDao;

  @override
  BlogPostCommentDao get blogPostCommentDao => driftBlogPostCommentDao;

  @override
  CourseCategoryDao get courseCategoryDao => driftCourseCategoryDao;

  @override
  CourseLearnerDao get courseLearnerDao => driftCourseLearnerDao;

  @override
  UserCourseDao get userCourseDao => driftUserCourseDao;

  @override
  OfflineCourseDao get offlineCourseDao => driftOfflineCourseDao;

  @override
  OfflineCourseMediaDao get offlineCourseMediaDao => driftOfflineCourseMediaDao;

  @override
  CourseDownloadStatusDao get courseDownloadStatusDao => driftCourseDownloadStatusDao;

  @override
  LectureDao get lectureDao => driftLectureDao;

  @override
  LearningActivityDao get learningActivityDao => driftLearningActivityDao;

  @override
  LearningSummaryDao get learningSummaryDao => driftLearningSummaryDao;

  @override
  LearningQuizDao get learningQuizDao => driftLearningQuizDao;

  @override
  LiveSessionDao get liveSessionDao => driftLiveSessionDao;

  @override
  CourseAssessmentQuestionDao get courseAssessmentQuestionDao => driftCourseAssessmentQuestionDao;
}
