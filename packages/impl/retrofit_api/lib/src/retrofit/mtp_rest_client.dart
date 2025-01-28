import 'dart:io';

import 'package:api/api.dart';
import 'package:domain/domain.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit_api/src/retrofit/rest_clients/contact_us_rest_client_mixin.dart';
import 'rest_clients/reset_clients.dart';

part 'mtp_rest_client.g.dart';

@RestApi()
abstract class MtpRestClient
    with
        LearningRestClientMixin,
        BlogRestClientMixin,
        ThematicGroupRestClientMixin,
        ContactUsRestClientMixin {
  factory MtpRestClient(Dio dio, {required String baseUrl}) = _MtpRestClient;

  @POST('/auth/login')
  @PublicApi()
  Future<ApiDataResponse<LoginSuccessResponseRM>> login({
    @Field('username') required String username,
    @Field('password') required String password,
  });

  @POST('/auth/change-password')
  Future<ApiDataResponse<ChangePasswordSuccessResponseRM>> changePassword({
    @Field('current_password') required String currentPassword,
    @Field('password') required String password,
    @Field('password_confirmation') required String confirmPassword,
  });

  @POST('/auth/register')
  @MultiPart()
  @PublicApi()
  Future<ApiDataResponse<UserRM>> register({
    @Part(name: 'account_type') required String accountType,
    @Part(name: 'user_type_all') required String userType,
    @Part(name: 'organization') String? organization,
    @Part(name: 'affiliation') String? affiliation,
    @Part(name: 'position') String? position,
    @Part(name: 'ec_college') int? collegeId,
    @Part(name: 'suitable_for_ec_year[]') String? educationYear,
    @Part(name: 'username') required String username,
    @Part(name: 'name') required String fullName,
    @Part(name: 'email') required String email,
    @Part(name: 'password') required String password,
    @Part(name: 'password_confirmation') required String confirmPassword,
    @Part(name: 'country_code') required int? phoneCode,
    @Part(name: 'mobile_no') required String? phoneNumber,
    @Part(name: 'notification_channel[]') required List<String> otpChannels,
    @Part(name: 'gender') required String gender,
    @Part(name: 'profile_image') File? profileImage,
  });

  @POST('/auth/profile')
  @MultiPart()
  Future<ApiDataResponse<UserRM>> updateUser({
    @Part(name: 'account_type') required String accountType,
    @Part(name: 'user_type_all') required String userType,
    @Part(name: 'organization') String? organization,
    @Part(name: 'affiliation') String? affiliation,
    @Part(name: 'position') String? position,
    @Part(name: 'ec_college') int? collegeId,
    @Part(name: 'suitable_for_ec_year[]') String? educationYear,
    @Part(name: 'username') required String username,
    @Part(name: 'name') required String fullName,
    @Part(name: 'email') required String email,
    @Part(name: 'country_code') required int? phoneCode,
    @Part(name: 'mobile_no') required String? phoneNumber,
    @Part(name: 'notification_channel[]') required List<String> otpChannels,
    @Part(name: 'gender') required String gender,
    @Part(name: 'profile_image') File? profileImage,
    @Query('include') String include = 'college,years',
  });

  @POST('/auth/verify-otp')
  @PublicApi()
  Future<ApiDataResponse<dynamic>> verifyOtp({
    @Field('otp_code') required String otpCode,
    @Field('credential') required String credential,
  });

  @POST('/auth/password-reset/token')
  @PublicApi()
  Future<ApiDataResponse<dynamic>> requestPasswordResetToken({
    @Field('credential') required String credential,
  });

  @POST('/auth/password-reset/verify')
  @PublicApi()
  Future<ApiDataResponse<dynamic>> verifyPasswordResetToken({
    @Field('credential') required String credential,
    @Field('token') required String token,
  });

  @POST('/auth/password-reset/reset')
  @PublicApi()
  Future<ApiDataResponse<dynamic>> resetPassword({
    @Field('credential') required String credential,
    @Field('token') required String token,
    @Field('password') required String password,
    @Field('password_confirmation') required String confirmPassword,
  });

  @POST('/auth/resend-otp')
  @PublicApi()
  Future<ApiDataResponse<dynamic>> resendOtp({
    @Field('credential') required String credential,
  });

  @POST('/users/deactivate')
  Future<ApiDataResponse<dynamic>> deactivate();

  @GET('/auth/me')
  Future<ApiDataResponse<UserRM>> getMe({
    @Query('include') String include = 'college,years',
  });

  @GET('/colleges')
  @PublicApi()
  Future<ApiDataResponse<List<CollegeRM>>> getColleges();

  @GET('/years')
  @PublicApi()
  Future<ApiDataResponse<List<EducationYearRM>>> getEducationYears();

  @GET('/subscriptions/get-terms')
  Future<ApiDataResponse<SubscriptionTermRM>> getSubscriptionTerm();

  @POST('/subscriptions/subscribe')
  Future<ApiMessageDataResponse<dynamic>> subscribe();

  @POST('/subscriptions/unsubscribe')
  Future<ApiMessageDataResponse<dynamic>> unsubscribe();

  @GET('/faqs?published=1')
  Future<ApiDataResponse<List<FaqRM>>> getFaqs({
    @Query('page') int page = 1,
    @Query('limit') int limit = 1000,
  });

  //#region e_library
  @GET('/resources')
  @PublicApi()
  Future<ApiDataResponse<List<ResourceRM>>> getResources({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('search[value]') String? search,
    @Query('resource_format') String? resourceFormat,
    @Query('subjects->id[]') String? subjectId,
    @Query('scopes[0][name]') String scopeKey = 'privacyFilter',
    @Query('scopes[0][parameters][0]') required String userType,
    @Query('sort[0][field]') String sortField = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @GET('/courses/{course_id}/get-related-resources')
  @PublicApi()
  Future<ApiDataResponse<List<ResourceRM>>> getResourcesByCourseId({
    @Path('course_id') required String courseId,
    @Query('page') int page = 1,
    @Query('limit') int limit = 99999,
  });

  @GET('/resoure-formats')
  @PublicApi()
  Future<ApiDataResponse<List<ResourceFormatRM>>> getResourceFormats();

  @GET('/subjects')
  @PublicApi()
  Future<ApiDataResponse<List<SubjectRM>>> getSubjects();

  //#endregion

  //#region Notification
  @GET('/notifications')
  Future<NotificationListResponse> getNotificationsData({
    @Query('limit') int limit = 1000,
  });

  @POST('/notifications/set-fcn-token')
  Future<FcmTokenResponseRM> setFcmToken({
    @Field('fcm_token') required String token,
  });

  @GET('/notifications/{notiId}')
  Future<NotificationDetailResponseRM> getNotificationDetail(
      {@Path('notiId') required String notiId});

  //#endregion

  @POST('/chat-gpt')
  @PublicApi()
  Future<String> getChatGPTMessage({
    @Field('prompt') required String prompt,
  });

  @GET('/community-videos')
  @PublicApi()
  Future<ApiDataResponse<List<CommunityVideoRM>>> getCommunityVideos({
    // @Query('is_published') required int isPublished,
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('type') required String type,
    @Query('search[value]') String? search,
    @Query('sort[0][field]') String sort = 'id',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @GET('/community-videos')
  @PublicApi()
  Future<ApiDataResponse<List<CommunityVideoRM>>> getRelatedCommunityVideos({
    @Query('filters[0][field]') String filterField = 'id',
    @Query('filters[0][operator]') String operator = '!=',
    @Query('filters[0][value]') required int id,
    // @Query('is_published') required int isPublished,
    @Query('limit') required int limit,
    @Query('type') required String type,
    @Query('sort[0][field]') String sort = 'id',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @GET('/community-videos/{id}')
  @PublicApi()
  Future<ApiDataResponse<CommunityVideoRM>> getCommunityVideoById({
    @Path('id') required int id,
    @Query('view') int? viewCount,
  });

  @GET('/home-page-video')
  @PublicApi()
  Future<ApiDataResponse<HomePageVideoRM>> getHomePageVideo();

  @GET('/get-mobile-app-version')
  @PublicApi()
  Future<ApiDataResponse<Version>> getCurrentVersion();

  @GET('/get-offline-content-step-by-step')
  @PublicApi()
  Future<ApiDataResponse<OfflineContentRM>> getOfflineContent();

  @GET('/slides')
  @PublicApi()
  Future<ApiDataResponse<List<SlideRM>>> getSlides();

  @GET('/user-manuals')
  @PublicApi()
  Future<ApiDataResponse<UserManualResponseRM>> getUserManuals({
    @Query('type') String type = 'all',
  });

  @GET('/pages/menu')
  @PublicApi()
  Future<ApiDataResponse<List<CmsMenuRM>>> getCmsMenus({
    @Query('base_url') int includeBaseUrl = 1,
    @Query('show_mobile') int showOnMobile = 1,
  });
}

class PublicApi extends Headers {
  const PublicApi() : super(const <String, dynamic>{'Authorization': 'None'});
}
