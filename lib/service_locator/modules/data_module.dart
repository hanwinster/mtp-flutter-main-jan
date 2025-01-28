import 'package:base/base.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

Future<void> provideDataModule({
  required PreferencesDataSource prefs,
}) async {
  // Common
  getIt.registerLazySingleton<ChatGPTRepository>(
      () => DefaultChatGPTRepository());
  getIt.registerLazySingleton<HomePageVideoRepository>(
      () => DefaultHomePageVideoRepository());
  getIt.registerLazySingleton<OfflineContentRepository>(
      () => DefaultOfflineContentRepository());
  getIt.registerLazySingleton<SlideRepository>(() => DefaultSlideRepository());
  getIt.registerLazySingleton<SubscriptionRepository>(
      () => DefaultSubscriptionRepository());

  getIt.registerLazySingleton<NotificationRepository>(
      () => DefaultNotificationRepository());
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => DefaultAuthenticationRepository());
  getIt.registerLazySingleton<UserDataRepository>(
      () => DefaultUserDataRepository());
  getIt.registerLazySingleton<CollegeRepository>(
      () => DefaultCollegeRepository());
  getIt.registerLazySingleton<EducationYearRepository>(
      () => DefaultEducationYearRepository());
  getIt.registerLazySingleton<FaqRepository>(() => DefaultFaqRepository());
  getIt.registerLazySingleton<VersionCheckRepo>(() => DefaultVersionCheckRepoImp());

  // User feature
  getIt.registerLazySingleton<UserRepository>(() => DefaultUserRepository());

  //#region: Blog feature
  getIt.registerLazySingleton<BlogPostCategoryRepository>(
      () => DefaultBlogPostCategoryRepository());
  getIt.registerLazySingleton<BlogPostRepository>(
      () => DefaultBlogPostRepository());
  getIt.registerLazySingleton<BlogPostCommentRepository>(
      () => DefaultBlogPostCommentRepository());
  getIt.registerLazySingleton<BlogPostQuizRepository>(
      () => DefaultBlogPostQuizRepository());
  //#endregion

  //#region Learning feature
  getIt.registerLazySingleton<CourseCategoryRepository>(
      () => DefaultCourseCategoryRepository());
  getIt
      .registerLazySingleton<CourseRepository>(() => DefaultCourseRepository());
  getIt.registerLazySingleton<LectureRepository>(
      () => DefaultLectureRepository());
  getIt.registerLazySingleton<LearningQuizRepository>(
      () => DefaultLearningQuizRepository());
  getIt.registerLazySingleton<LearningSummaryRepository>(
      () => DefaultLearningSummaryRepository());
  getIt.registerLazySingleton<LearningActivityRepository>(
      () => DefaultLearningActivityRepository());
  getIt.registerLazySingleton<LiveSessionRepository>(
          () => DefaultLiveSessionRepository());
  getIt.registerLazySingleton<EvaluationRepository>(
      () => DefaultEvaluationRepository());
  getIt.registerLazySingleton<CourseAssessmentRepository>(
      () => DefaultCourseAssessmentRepository());
  getIt.registerLazySingleton<CourseReviewRepository>(
      () => DefaultCourseReviewRepository());
  getIt.registerLazySingleton<CourseDiscussionMessageRepository>(
      () => DefaultCourseDiscussionMessageRepository());
  //#endregion

  //#region E-Library feature
  getIt.registerLazySingleton<ResourceRepository>(
      () => DefaultResourceRepository());
  getIt.registerLazySingleton<FcmTokenRepository>(
      () => DefaultFcmTokenRepository());
  //#endregion

  //#region Community Video feature
  getIt.registerLazySingleton<CommunityVideoRepository>(
      () => DefaultCommunityVideoRepository());
  //#endregion

  //#region Thematic Group
  getIt.registerLazySingleton<ThematicGroupRepository>(
      () => DefaultThematicGroupRepository());
  getIt.registerLazySingleton<ThematicGroupPostRepository>(
      () => DefaultThematicGroupPostRepository());
  getIt.registerLazySingleton<ThematicGroupPostCommentRepository>(
          () => DefaultThematicGroupPostCommentRepository());
  //#endregion

  //#region Contact Us
  getIt.registerLazySingleton<ContactInfoRepository>(
      () => DefaultContactInfoRepository());
  //#endregion

  //#region User Manual
  getIt.registerLazySingleton<UserManualRepository>(
      () => DefaultUserManualRepository());
  getIt.registerLazySingleton<CmsMenuRepository>(
      () => DefaultCmsMenuRepository());
  //#endregion
}
