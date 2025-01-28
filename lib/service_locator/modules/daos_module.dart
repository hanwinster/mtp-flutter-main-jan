import 'package:base/base.dart';
import 'package:database/database.dart';

Future<void> provideDaosModule({
  required MtpDatabase db,
}) async {
  //#region Blog feature
  getIt.registerFactory<BlogPostCategoryDao>(() => db.blogPostCategoryDao);
  getIt.registerFactory<BlogPostDao>(() => db.blogPostDao);
  getIt.registerFactory<BlogPostCommentDao>(() => db.blogPostCommentDao);
  // getIt.registerFactory<ThematicgroupPostCommentDao>(()=>db.commentDao);
  //#endregion

  //#region Learning feature
  getIt.registerFactory<CourseCategoryDao>(() => db.courseCategoryDao);
  getIt.registerFactory<CourseLearnerDao>(() => db.courseLearnerDao);
  getIt.registerFactory<UserCourseDao>(() => db.userCourseDao);
  getIt.registerFactory<OfflineCourseDao>(() => db.offlineCourseDao);
  getIt.registerFactory<OfflineCourseMediaDao>(() => db.offlineCourseMediaDao);
  getIt.registerFactory<CourseDownloadStatusDao>(() => db.courseDownloadStatusDao);
  getIt.registerFactory<LectureDao>(() => db.lectureDao);
  getIt.registerFactory<LearningActivityDao>(() => db.learningActivityDao);
  getIt.registerFactory<LearningSummaryDao>(() => db.learningSummaryDao);
  getIt.registerFactory<LearningQuizDao>(() => db.learningQuizDao);
  getIt.registerFactory<LiveSessionDao>(() => db.liveSessionDao);
  getIt.registerFactory<CourseAssessmentQuestionDao>(() => db.courseAssessmentQuestionDao);
  //#endregion
}
