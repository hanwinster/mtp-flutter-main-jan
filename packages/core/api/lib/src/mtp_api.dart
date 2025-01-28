import 'dart:async';

import 'package:api/api.dart';
import 'package:domain/domain.dart';

abstract class MtpApi
    implements LearningApi, BlogApi, ThematicGroupApi, ContactUsApi {
  String get apiBaseUrl;

//#region Common
  Future<String> getChatGPTMessages({
    required String prompt,
  });

  Future<ApiDataResponse<LoginSuccessResponseRM>> login({
    required String username,
    required String password,
  });

  Future<ApiDataResponse<ChangePasswordSuccessResponseRM>> changePassword({
    required String currentPassword,
    required String password,
    required String confirmPassword,
  });

  Future<UserRM> register({
    required NewUserPayload payload,
  });

  Future<ApiDataResponse<dynamic>> verifyOtp({
    required String otpCode,
    required String credential,
  });

  Future<ApiDataResponse<dynamic>> requestPasswordResetToken({
    required String credential,
  });

  Future<ApiDataResponse<dynamic>> verifyPasswordResetToken({
    required String credential,
    required String token,
  });

  Future<ApiDataResponse<dynamic>> resetPassword({
    required String credential,
    required String token,
    required String password,
    required String confirmPassword,
  });

  Future<ApiDataResponse<dynamic>> resendOtp({
    required String credential,
  });

  Future<ApiDataResponse<dynamic>> deactivate();

  Future<UserRM> getMe();

  Future<UserRM> updateUser({
    required UpdateUserPayload payload,
  });

  Future<List<CollegeRM>> getColleges();

  Future<List<EducationYearRM>> getEducationYears();

  Future<SubscriptionTermRM> getSubscriptionTerm();

  Future<String> subscribe();

  Future<String> unsubscribe();

  Future<List<FaqRM>> getFaqs();

//#endregion

//#region E-Library
  Future<List<ResourceRM>> getResources({
    required int page,
    required int limit,
    required String userType,
    String? search,
    String? resourceFormat,
    String? subjectId,
  });

  Future<List<SubjectRM>> getSubject();

  Future<List<ResourceFormatRM>> getResourceFormat();

  Future<List<ResourceRM>> getResourcesByCourseId({
    required String courseId,
  });

//#endregion

//#region Notification
  Future<NotificationListResponse> getNotificationListResponse();

  Future<FcmTokenResponseRM> updateFcmToken({required String token});

  Future<NotificationDetailResponseRM> getNotificationDetail({
    required String notiId,
  });

//#endregion

//#region Community Video
  Future<List<CommunityVideoRM>> getCommunityVideos({
    required int isPublished,
    required int page,
    required int limit,
    required String type,
    String? search,
  });

  Future<List<CommunityVideoRM>> getRelatedCommunityVideos({
    required int id,
    required int limit,
    required String type,
    required int isPublished,
  });

  Future<CommunityVideoRM> getCommunityVideoById({
    required int videoId,
    int? viewCount,
  });

  Future<List<SlideRM>> getSlides();

  Future<OfflineContentRM> getOfflineContent();

  Future<HomePageVideoRM> getHomePageVideo();
  Future<Version> getCurrentVersion();

//#endregion

  //#region User Manual
  Future<List<UserManualRM>> getUserManuals();

  Future<List<CmsMenuRM>> getCmsMenus();
//#endregion
}
