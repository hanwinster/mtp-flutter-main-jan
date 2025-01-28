import 'package:base/base.dart';
import 'package:domain/domain.dart';

Future<void> provideDomainModule() async {
  // auth
  getIt.registerFactory<ObserveAuthStateUseCase>(
      () => ObserveAuthStateUseCase());
  getIt.registerFactory<GetCurrentUserIdUseCase>(
      () => GetCurrentUserIdUseCase());
  getIt.registerFactory<LogInUseCase>(() => LogInUseCase());
  getIt.registerFactory<LogOutUseCase>(() => LogOutUseCase());
  getIt.registerFactory<ChangePasswordUseCase>(() => ChangePasswordUseCase());
  getIt.registerFactory<DeactivateUseCase>(() => DeactivateUseCase());
  getIt.registerFactory<RegisterNewUserUseCase>(() => RegisterNewUserUseCase());
  getIt.registerFactory<VerifyOtpUseCase>(() => VerifyOtpUseCase());
  getIt.registerFactory<InitiateResetPasswordUseCase>(
      () => InitiateResetPasswordUseCase());
  getIt.registerFactory<ResetPasswordUseCase>(() => ResetPasswordUseCase());
  getIt.registerFactory<ResendOtpUseCase>(() => ResendOtpUseCase());

  // user
  getIt.registerFactory<SaveLanguageUseCase>(() => SaveLanguageUseCase());
  getIt.registerFactory<ObserveUserLanguageUseCase>(
      () => ObserveUserLanguageUseCase());
  getIt.registerFactory<ObserveLoggedInUserUseCase>(
      () => ObserveLoggedInUserUseCase());
  getIt.registerFactory<ObserveCollegesUseCase>(() => ObserveCollegesUseCase());
  getIt.registerFactory<ObserveEducationYearsUseCase>(
      () => ObserveEducationYearsUseCase());
  getIt.registerFactory<UpdateUserUseCase>(() => UpdateUserUseCase());

  //#region: Blog feature
  getIt.registerFactory<ObserveBlogPostCategoriesUseCase>(
      () => ObserveBlogPostCategoriesUseCase());
  getIt.registerFactory<ObserveLatestBlogPostsUseCase>(
      () => ObserveLatestBlogPostsUseCase());
  getIt.registerFactory<ObserveRecommendedBlogPostsUseCase>(
      () => ObserveRecommendedBlogPostsUseCase());
  getIt.registerFactory<ObserveBlogPostsByCategoryUseCase>(
      () => ObserveBlogPostsByCategoryUseCase());
  getIt.registerFactory<ObserveBlogPostsByTagUseCase>(
      () => ObserveBlogPostsByTagUseCase());
  getIt.registerFactory<ObserveBlogPostByIdUseCase>(
      () => ObserveBlogPostByIdUseCase());
  getIt.registerFactory<ObserveBlogPostCommentsUseCase>(
      () => ObserveBlogPostCommentsUseCase());

  getIt.registerFactory<CreateBlogPostCommentUseCase>(
      () => CreateBlogPostCommentUseCase());
  getIt.registerFactory<UpdateBlogPostCommentUseCase>(
      () => UpdateBlogPostCommentUseCase());
  getIt.registerFactory<DeleteBlogPostCommentUseCase>(
      () => DeleteBlogPostCommentUseCase());

  getIt.registerFactory<CreateBlogPostReactionUseCase>(
      () => CreateBlogPostReactionUseCase());
  getIt.registerFactory<UpdateBlogPostReactionUseCase>(
      () => UpdateBlogPostReactionUseCase());
  getIt.registerFactory<DeleteBlogPostReactionUseCase>(
      () => DeleteBlogPostReactionUseCase());

  getIt.registerFactory<CreateBlogPostCommentReactionUseCase>(
      () => CreateBlogPostCommentReactionUseCase());
  getIt.registerFactory<UpdateBlogPostCommentReactionUseCase>(
      () => UpdateBlogPostCommentReactionUseCase());
  getIt.registerFactory<DeleteBlogPostCommentReactionUseCase>(
      () => DeleteBlogPostCommentReactionUseCase());

  getIt.registerFactory<GetBlogPostQuizQuestionsUseCase>(
      () => GetBlogPostQuizQuestionsUseCase());
  getIt.registerFactory<SaveBlogPostQuizAnswersUseCase>(
      () => SaveBlogPostQuizAnswersUseCase());
  getIt.registerFactory<SubmitBlogPostQuizAnswersUseCase>(
      () => SubmitBlogPostQuizAnswersUseCase());

  getIt.registerFactory<MarkBlogPostAsReadUseCase>(
      () => MarkBlogPostAsReadUseCase());
  //#endregion

  //#region Learning feature
  getIt.registerFactory<ObserveCourseCategoriesUseCase>(
      () => ObserveCourseCategoriesUseCase());
  getIt.registerFactory<ObserveCoursesUseCase>(() => ObserveCoursesUseCase());
  getIt.registerFactory<GetXApiCourseUseCase>(() => GetXApiCourseUseCase());
  getIt.registerFactory<ObserveCourseLearnerUseCase>(
      () => ObserveCourseLearnerUseCase());
  getIt.registerFactory<GetCoursesUseCase>(() => GetCoursesUseCase());
  getIt.registerFactory<ObserveUserCoursesUseCase>(
      () => ObserveUserCoursesUseCase());
  getIt.registerFactory<ObserveCourseUseCase>(() => ObserveCourseUseCase());
  getIt.registerFactory<TakeCourseUseCase>(() => TakeCourseUseCase());
  getIt.registerFactory<ObserveLectureUseCase>(() => ObserveLectureUseCase());
  getIt.registerFactory<ObserveLearningQuizUseCase>(
      () => ObserveLearningQuizUseCase());
  getIt.registerFactory<ObserveLiveSessionUseCase>(
          () => ObserveLiveSessionUseCase());
  getIt.registerFactory<ObserveLearningSummaryUseCase>(
      () => ObserveLearningSummaryUseCase());
  getIt.registerFactory<ObserveLearningActivityUseCase>(
      () => ObserveLearningActivityUseCase());
  getIt.registerFactory<ObserveEvaluationQuestionsUseCase>(
      () => ObserveEvaluationQuestionsUseCase());
  getIt.registerFactory<ObserveCourseAssessmentUseCase>(
      () => ObserveCourseAssessmentUseCase());
  getIt.registerFactory<SaveAssessmentAnswerUseCase>(
      () => SaveAssessmentAnswerUseCase());
  getIt.registerFactory<SubmitCourseAssessmentUseCase>(
      () => SubmitCourseAssessmentUseCase());
  getIt.registerFactory<SaveQuizAnswerUseCase>(() => SaveQuizAnswerUseCase());
  getIt.registerFactory<SubmitQuizAssignmentUseCase>(
      () => SubmitQuizAssignmentUseCase());
  getIt.registerFactory<SaveEvaluationAnswersUseCase>(
      () => SaveEvaluationAnswersUseCase());
  getIt.registerFactory<UpdateLearningCompletionUseCase>(
      () => UpdateLearningCompletionUseCase());
  getIt.registerFactory<CancelCourseUseCase>(() => CancelCourseUseCase());
  getIt.registerFactory<ObserveOfflineCoursesUseCase>(
      () => ObserveOfflineCoursesUseCase());
  getIt.registerFactory<NavigateOfflineCourseMaterialUseCase>(
      () => NavigateOfflineCourseMaterialUseCase());
  getIt.registerFactory<ObserveCourseDownloadStatusUseCase>(
      () => ObserveCourseDownloadStatusUseCase());
  getIt.registerFactory<MarkCourseDownloadStatusAsHandledUseCase>(
      () => MarkCourseDownloadStatusAsHandledUseCase());
  getIt.registerFactory<DeleteOfflineCourseUseCase>(
      () => DeleteOfflineCourseUseCase());
  getIt.registerFactory<ObserveCourseReviewsUseCase>(
      () => ObserveCourseReviewsUseCase());
  getIt.registerFactory<ObserveCourseDiscussionMessagesUseCase>(
      () => ObserveCourseDiscussionMessagesUseCase());
  getIt.registerFactory<ObserveCourseRelatedResourcesUseCase>(
      () => ObserveCourseRelatedResourcesUseCase());
  getIt.registerFactory<CreateCourseDiscussionMessageUseCase>(
      () => CreateCourseDiscussionMessageUseCase());
  getIt.registerFactory<CreateCourseReviewUseCase>(
      () => CreateCourseReviewUseCase());
  getIt.registerFactory<ObserveCourseAssessmentsUseCase>(
      () => ObserveCourseAssessmentsUseCase());
  getIt.registerFactory<SaveOfflineCourseMediaUseCase>(
      () => SaveOfflineCourseMediaUseCase());
  getIt.registerFactory<ObserveOfflineCourseMediaListUseCase>(
      () => ObserveOfflineCourseMediaListUseCase());
  getIt.registerFactory<DeleteOfflineCourseMediaUseCase>(
      () => DeleteOfflineCourseMediaUseCase());
  //#endregion

  //#region E-Library feature
  getIt.registerFactory<ObserveResourcesUseCase>(
      () => ObserveResourcesUseCase());
  getIt.registerFactory<GetResourcesUseCase>(() => GetResourcesUseCase());
  getIt.registerFactory<GetResourceFormatUseCase>(
      () => GetResourceFormatUseCase());
  getIt.registerFactory<GetSubjectsUseCase>(() => GetSubjectsUseCase());
  //#endregion

  getIt.registerFactory<GetChatGptUseCase>(() => GetChatGptUseCase());
  getIt.registerFactory<GetHomePageVideoUseCase>(
      () => GetHomePageVideoUseCase());
  getIt.registerFactory<GetCurrentVersionUseCase>(
      () => GetCurrentVersionUseCase());
  getIt.registerFactory<GetOfflineContentUseCase>(
      () => GetOfflineContentUseCase());
  getIt.registerFactory<GetSlideListUseCase>(() => GetSlideListUseCase());

  //#region Community Video feature
  getIt.registerFactory<CommunityVideoListUseCase>(
      () => CommunityVideoListUseCase());
  getIt.registerFactory<CommunityVideoDetailUseCase>(
      () => CommunityVideoDetailUseCase());
  getIt.registerFactory<GetRelatedCommunityVideoListUseCase>(
      () => GetRelatedCommunityVideoListUseCase());

  //#endregion

  //#region Notification feature
  getIt.registerFactory<GetNotificationsUseCase>(
      () => GetNotificationsUseCase());

  getIt.registerFactory<GetNotificationsDetailUseCase>(
      () => GetNotificationsDetailUseCase());

  getIt.registerFactory<FcmTokenUseCase>(() => FcmTokenUseCase());
  //#eindregion

  //#region Thematic Group
  getIt.registerFactory<GetThematicRecommendGroupsUseCase>(
      () => GetThematicRecommendGroupsUseCase());
  getIt.registerFactory<GetThematicUserGroupsUseCase>(
      () => GetThematicUserGroupsUseCase());
  getIt.registerFactory<GetGroupUseCase>(() => GetGroupUseCase());
  getIt.registerFactory<RequestGroupJoinUseCase>(
      () => RequestGroupJoinUseCase());
  getIt.registerFactory<ObserveThematicGroupPostListUseCase>(
      () => ObserveThematicGroupPostListUseCase());
  getIt.registerFactory<CreateGroupPostUseCase>(() => CreateGroupPostUseCase());
  getIt.registerFactory<EditGroupPostUseCase>(() => EditGroupPostUseCase());

  // reaction
  getIt.registerFactory<CreateGroupPostReactionUseCase>(
      () => CreateGroupPostReactionUseCase());
  getIt.registerFactory<UpdateGroupPostReactionUseCase>(
      () => UpdateGroupPostReactionUseCase());
  getIt.registerFactory<DeleteGroupPostReactionUseCase>(
      () => DeleteGroupPostReactionUseCase());

  // comment
  getIt.registerFactory<ObserveThematicGroupPostCommentsUseCase>(
      () => ObserveThematicGroupPostCommentsUseCase());
  getIt.registerFactory<CreateThematicGroupPostCommentUseCase>(
      () => CreateThematicGroupPostCommentUseCase());
  getIt.registerFactory<UpdateThematicGroupPostCommentUseCase>(
      () => UpdateThematicGroupPostCommentUseCase());
  getIt.registerFactory<DeleteGroupPostCommentUseCase>(
      () => DeleteGroupPostCommentUseCase());

  // reply
  getIt.registerFactory<CreateGroupPostCommentReplyUseCase>(
      () => CreateGroupPostCommentReplyUseCase());
  getIt.registerFactory<UpdateGroupPostCommentReplyUseCase>(
      () => UpdateGroupPostCommentReplyUseCase());
  getIt.registerFactory<DeleteGroupPostReplyUseCase>(
      () => DeleteGroupPostReplyUseCase());

  getIt.registerFactory<GetGroupRulesUseCase>(() => GetGroupRulesUseCase());
  getIt.registerFactory<GetGroupCategoriesUseCase>(
      () => GetGroupCategoriesUseCase());

  getIt.registerFactory<DeleteGroupPostUseCase>(() => DeleteGroupPostUseCase());
  getIt.registerFactory<LeaveGroupUseCase>(() => LeaveGroupUseCase());

  getIt.registerFactory<GetGroupApprovedPostsUseCase>(
      () => GetGroupApprovedPostsUseCase());
  getIt.registerFactory<GetGroupPendingPostsUseCase>(
      () => GetGroupPendingPostsUseCase());
  getIt.registerFactory<GetGroupPostUseCase>(() => GetGroupPostUseCase());

  //#endregion

  //#region Subscription
  getIt.registerFactory<GetSubscriptionTermUseCase>(
      () => GetSubscriptionTermUseCase());
  getIt.registerFactory<SubscribeUseCase>(() => SubscribeUseCase());
  getIt.registerFactory<UnsubscribeUseCase>(() => UnsubscribeUseCase());
  //#endregion

  //#region FAQ
  getIt.registerFactory<GetFaqsUseCase>(() => GetFaqsUseCase());
  //#endregion

  //#region Contact Us
  getIt.registerFactory<GetContactInfoUseCase>(() => GetContactInfoUseCase());
  getIt.registerFactory<GetContactRegionsUseCase>(
      () => GetContactRegionsUseCase());
  getIt.registerFactory<SendContactMessageUseCase>(
      () => SendContactMessageUseCase());
  //#endregion

  //#region User Manual
  getIt.registerFactory<GetUserManualsUseCase>(() => GetUserManualsUseCase());
  getIt.registerFactory<GetCmsMenusUseCase>(() => GetCmsMenusUseCase());
  //#endregion
}
