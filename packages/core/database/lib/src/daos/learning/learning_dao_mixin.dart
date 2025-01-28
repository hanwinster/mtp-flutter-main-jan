import 'package:database/database.dart';

mixin LearningDaoMixin {
  CourseCategoryDao get courseCategoryDao;
  CourseLearnerDao get courseLearnerDao;
  UserCourseDao get userCourseDao;
  OfflineCourseDao get offlineCourseDao;
  OfflineCourseMediaDao get offlineCourseMediaDao;
  CourseDownloadStatusDao get courseDownloadStatusDao;
  LectureDao get lectureDao;
  LearningActivityDao get learningActivityDao;
  LearningSummaryDao get learningSummaryDao;
  LearningQuizDao get learningQuizDao;
  LiveSessionDao get liveSessionDao;
  CourseAssessmentQuestionDao get courseAssessmentQuestionDao;
}