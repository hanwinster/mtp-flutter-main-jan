import 'dart:io';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:preferences/preferences.dart';

import '../api_call.dart';
import 'rest_clients/reset_clients.dart';
import 'retrofit_client_builder.dart';
import 'mtp_rest_client.dart';

class RetrofitMtpApi extends MtpApi {
  RetrofitMtpApi({
    required String baseUrl,
    required String apiBaseUrl,
    required PreferencesDataSource preferencesDataSource,
    MtpRestClient? mtpRestClient,
    List<Interceptor> interceptors = const [],
  })  : _apiBaseUrl = apiBaseUrl,
        _clientBuilder = RetrofitClientBuilder(
          apiBaseUrl: apiBaseUrl,
          interceptors: interceptors,
          preferencesDataSource: preferencesDataSource,
        ) {
    _mtpRestClient = mtpRestClient ?? _clientBuilder.mtpRestClient;
  }

  final RetrofitClientBuilder _clientBuilder;
  late MtpRestClient _mtpRestClient;
  final String _apiBaseUrl;

  @override
  String get apiBaseUrl => _apiBaseUrl;

  //#region Common
  @override
  Future<ApiDataResponse<LoginSuccessResponseRM>> login({
    required String username,
    required String password,
  }) async {
    final response = await apiCall<ApiDataResponse<LoginSuccessResponseRM>>(
      () => _mtpRestClient.login(username: username, password: password),
    );
    return response;
  }

  @override
  Future<ApiDataResponse<ChangePasswordSuccessResponseRM>> changePassword({
    required String currentPassword,
    required String password,
    required String confirmPassword,
  }) async {
    final response =
        await apiCall<ApiDataResponse<ChangePasswordSuccessResponseRM>>(
      () => _mtpRestClient.changePassword(
        currentPassword: currentPassword,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    return response;
  }

  @override
  Future<UserRM> register({
    required NewUserPayload payload,
  }) async {
    final response = await apiCall<ApiDataResponse<UserRM>>(
      () => _mtpRestClient.register(
        accountType: payload.accountType,
        userType: payload.userType,
        organization: payload.organization,
        affiliation: payload.affiliation,
        position: payload.position,
        collegeId: payload.collegeId,
        educationYear: payload.educationYear,
        username: payload.username,
        fullName: payload.fullName,
        email: payload.email,
        password: payload.password,
        confirmPassword: payload.confirmPassword,
        phoneCode: payload.phoneCode,
        phoneNumber: payload.phoneNumber,
        otpChannels: payload.otpChannels.map((e) => e.toJson()).toList(),
        profileImage: payload.profileImage,
        gender: payload.gender.toJson(),
      ),
    );
    return response.data;
  }

  @override
  Future<UserRM> updateUser({
    required UpdateUserPayload payload,
  }) async {
    final response = await apiCall<ApiDataResponse<UserRM>>(
      () => _mtpRestClient.updateUser(
        accountType: payload.accountType,
        userType: payload.userType,
        organization: payload.organization,
        affiliation: payload.affiliation,
        position: payload.position,
        collegeId: payload.collegeId,
        educationYear: payload.educationYear,
        username: payload.username,
        fullName: payload.fullName,
        email: payload.email,
        phoneCode: payload.phoneCode,
        phoneNumber: payload.phoneNumber,
        otpChannels: payload.otpChannels.map((e) => e.toJson()).toList(),
        profileImage: payload.profileImage,
        gender: payload.gender.toJson(),
      ),
    );
    return response.data;
  }

  @override
  Future<ApiDataResponse<dynamic>> verifyOtp({
    required String otpCode,
    required String credential,
  }) async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.verifyOtp(otpCode: otpCode, credential: credential),
    );
    return response;
  }

  @override
  Future<ApiDataResponse<dynamic>> requestPasswordResetToken({
    required String credential,
  }) async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.requestPasswordResetToken(credential: credential),
    );
    return response;
  }

  @override
  Future<ApiDataResponse<dynamic>> verifyPasswordResetToken({
    required String credential,
    required String token,
  }) async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.verifyPasswordResetToken(
        credential: credential,
        token: token,
      ),
    );
    return response;
  }

  @override
  Future<ApiDataResponse<dynamic>> resetPassword({
    required String credential,
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.resetPassword(
        credential: credential,
        token: token,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    return response;
  }

  @override
  Future<ApiDataResponse> resendOtp({required String credential}) async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.resendOtp(credential: credential),
    );
    return response;
  }

  @override
  Future<ApiDataResponse> deactivate() async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
        () => _mtpRestClient.deactivate());
    return response;
  }

  @override
  Future<UserRM> getMe() async {
    final response = await apiCall<ApiDataResponse<UserRM>>(
      () => _mtpRestClient.getMe(),
    );
    return response.data;
  }

  @override
  Future<List<CollegeRM>> getColleges() async {
    final response = await apiCall<ApiDataResponse<List<CollegeRM>>>(
      () => _mtpRestClient.getColleges(),
    );
    return response.data;
  }

  @override
  Future<List<EducationYearRM>> getEducationYears() async {
    final response = await apiCall<ApiDataResponse<List<EducationYearRM>>>(
      () => _mtpRestClient.getEducationYears(),
    );
    return response.data;
  }

  @override
  Future<SubscriptionTermRM> getSubscriptionTerm() async {
    final response = await apiCall<ApiDataResponse<SubscriptionTermRM>>(
      () => _mtpRestClient.getSubscriptionTerm(),
    );
    return response.data;
  }

  @override
  Future<String> subscribe() async {
    final response = await apiCall<ApiMessageDataResponse<dynamic>>(
      () => _mtpRestClient.subscribe(),
    );
    return response.message ?? '';
  }

  @override
  Future<String> unsubscribe() async {
    final response = await apiCall<ApiMessageDataResponse<dynamic>>(
      () => _mtpRestClient.unsubscribe(),
    );
    return response.message ?? '';
  }

  @override
  Future<List<FaqRM>> getFaqs() async {
    final response = await apiCall<ApiDataResponse<List<FaqRM>>>(
      () => _mtpRestClient.getFaqs(),
    );
    return response.data;
  }

  //#endregion

  //#region Blog
  @override
  Future<List<BlogPostRM>> getLatestBlogPosts() async {
    final response = await apiCall<ApiDataResponse<List<BlogPostRM>>>(
      () => _mtpRestClient.getLatestBlogPosts(),
    );
    return response.data;
  }

  @override
  Future<List<BlogPostCategoryRM>> getBlogPostCategories() async {
    final response = await apiCall<ApiDataResponse<List<BlogPostCategoryRM>>>(
      () => _mtpRestClient.getBlogPostCategories(),
    );
    return response.data;
  }

  @override
  Future<List<BlogPostRM>> getRecommendedBlogPosts() async {
    final response = await apiCall<ApiDataResponse<List<BlogPostRM>>>(
      () => _mtpRestClient.getRecommendedBlogPosts(),
    );
    return response.data;
  }

  @override
  Future<BlogPostCommentRM> createBlogPostComment({
    required int postId,
    required String text,
    File? image,
    File? video,
  }) async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.postBlogPostComment(
        postId: postId,
        text: text,
        image: image,
        video: video,
      ),
    );
    return response.data;
  }

  @override
  Future<BlogPostCommentRM> updateBlogPostComment({
    required int commentId,
    required int postId,
    required String text,
    File? image,
    File? video,
  }) async {
    final response = await apiCall<ApiDataResponse<BlogPostCommentRM>>(
      () => _mtpRestClient.putBlogPostComment(
        commentId: commentId,
        postId: postId,
        text: text,
      ),
    );
    return response.data;
  }

  @override
  Future<void> deleteBlogPostComment({
    required int commentId,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.deleteBlogPostComment(commentId: commentId),
    );
  }

  @override
  Future<List<BlogPostRM>> searchBlogPosts({
    String? keyword,
    int? categoryId,
    int? tagId,
  }) async {
    final categoryIds = [];
    if (categoryId != null) {
      categoryIds.add(categoryId);
    }
    final commaSeparatedCategoryIds =
        categoryIds.isNotEmpty ? categoryIds.join(',') : null;

    final tagIds = [];
    if (tagId != null) {
      tagIds.add(tagId);
    }
    final commaSeparatedTagIds = tagIds.isNotEmpty ? tagIds.join(',') : null;

    final response = await apiCall<ApiDataResponse<List<BlogPostRM>>>(
        () => _mtpRestClient.searchBlogPosts(
              query: keyword,
              commaSeparatedCategoryIds: commaSeparatedCategoryIds,
              commaSeparatedTagIds: commaSeparatedTagIds,
            ));
    return response.data;
  }

  @override
  Future<BlogPostRM> getBlogPost({required int postId}) async {
    final response = await apiCall<ApiDataResponse<BlogPostRM>>(
      () => _mtpRestClient.getBlogPostDetails(
        postId: postId,
      ),
    );
    return response.data;
  }

  @override
  Future<List<BlogPostCommentRM>> getBlogPostComments({
    required int postId,
  }) async {
    final response = await apiCall<ApiDataResponse<List<BlogPostCommentRM>>>(
      () => _mtpRestClient.getBlogPostComments(postId: postId),
    );
    return response.data;
  }

  @override
  Future<ReactionRM> createBlogPostReaction({
    required int postId,
    required String reaction,
  }) async {
    final response = await apiCall<ApiDataResponse<ReactionRM>>(
      () => _mtpRestClient.createBlogPostReaction(
        postId: postId,
        reaction: reaction,
      ),
    );
    return response.data;
  }

  @override
  Future<ReactionRM> updateBlogPostReaction({
    required int postId,
    required int reactionId,
    required String reaction,
  }) async {
    final response = await apiCall<ApiDataResponse<ReactionRM>>(
      () => _mtpRestClient.updateBlogPostReaction(
        reactionId: reactionId,
        reaction: reaction,
        postId: postId,
      ),
    );
    return response.data;
  }

  @override
  Future<dynamic> deleteBlogPostReaction({
    required int postId,
    required int reactionId,
  }) async {
    final response = await apiCall<dynamic>(
      () => _mtpRestClient.deleteBlogPostReaction(
        reactionId: reactionId,
      ),
    );
    return response;
  }

  @override
  Future<ReactionRM> createBlogPostCommentReaction({
    required int commentId,
    required String reaction,
  }) async {
    final response = await apiCall<ApiDataResponse<ReactionRM>>(
      () => _mtpRestClient.createBlogPostCommentReaction(
        commentId: commentId,
        reaction: reaction,
      ),
    );
    return response.data;
  }

  @override
  Future<ReactionRM> updateBlogPostCommentReaction({
    required int commentId,
    required int reactionId,
    required String reaction,
  }) async {
    final response = await apiCall<ApiDataResponse<ReactionRM>>(
      () => _mtpRestClient.updateBlogPostCommentReaction(
        commentId: commentId,
        reactionId: reactionId,
        reaction: reaction,
      ),
    );
    return response.data;
  }

  @override
  Future<dynamic> deleteBlogPostCommentReaction({
    required int commentId,
    required int reactionId,
  }) async {
    final response = await apiCall<dynamic>(
      () => _mtpRestClient.deleteBlogPostCommentReaction(
        reactionId: reactionId,
      ),
    );
    return response;
  }

  @override
  Future<List<BlogPostQuizQuestionRM>> getBlogPostQuizQuestions({
    required String postId,
  }) async {
    final response =
        await apiCall<ApiDataResponse<List<BlogPostQuizQuestionRM>>>(
      () => _mtpRestClient.getBlogPostQuizQuestions(
        postId: postId,
        includes: BlogRestClientMixin.quizIncludes,
      ),
    );
    return response.data;
  }

  @override
  Future<void> saveBlogPostQuizUserAnswers({
    required String postId,
    required String questionId,
    required Map<String, dynamic> answers,
  }) async {
    try {
      await apiCall(
        () => _mtpRestClient.saveBlogPostQuizUserAnswers(
          postId: postId.toIntOrThrow(),
          questionId: questionId.toIntOrThrow(),
          answers: answers,
        ),
      );
    } on ApiException catch (e, s) {
      logger.e("Error", e, s);

      if (e is ClientApiException && e.statusCode == 409) {
        await apiCall(
          () => _mtpRestClient.updateBlogPostQuizUserAnswers(
            postId: postId.toIntOrThrow(),
            questionId: questionId.toIntOrThrow(),
            answers: answers,
          ),
        );
        return;
      }

      rethrow;
    } catch (e, s) {
      logger.e("Error", e, s);
      rethrow;
    }
  }

  @override
  Future<void> updateBlogPostQuizUserAnswers({
    required String postId,
    required String questionId,
    required Map<String, dynamic> answers,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.updateBlogPostQuizUserAnswers(
        postId: postId.toIntOrThrow(),
        questionId: questionId.toIntOrThrow(),
        answers: answers,
      ),
    );
  }

  @override
  Future<BlogPostQuizUserAnswerResultRM> submitBlogPostQuizUserAnswer({
    required String postId,
  }) async {
    final result =
        await apiCall<ApiDataResponse<BlogPostQuizUserAnswerResultRM>>(
      () => _mtpRestClient.submitBlogPostQuizUserAnswer(
        postId: postId.toIntOrThrow(),
      ),
    );
    return result.data;
  }

  @override
  Future<void> markBlogPostAsRead({
    required String postId,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.markBlogPostAsRead(
        postId: postId.toIntOrThrow(),
      ),
    );
  }

  @override
  Future<void> trackBlogView({
    required String postId,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.trackBlogView(
        postId: postId.toIntOrThrow(),
      ),
    );
  }

  @override
  Future<void> trackBlogShare({
    required String postId,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.trackBlogShare(
        postId: postId.toIntOrThrow(),
      ),
    );
  }

  //#endregion

  //#region Learning
  @override
  Future<List<CourseCategoryRM>> getCourseCategories() async {
    final response = await apiCall<ApiDataResponse<List<CourseCategoryRM>>>(
      () => _mtpRestClient.getCourseCategories(),
    );
    return response.data;
  }

  @override
  Future<List<CourseRM>> getCourses({
    required String keyword,
    required int? categoryId,
    required int page,
    required int limit,
  }) async {
    final response = await apiCall<ApiDataResponse<List<CourseRM>>>(
      () => _mtpRestClient.getCourses(
        keyword: keyword,
        categoryId: categoryId,
        page: page,
        limit: limit,
        include: LearningRestClientMixin.coursesIncludes.join(','),
      ),
    );
    return response.data;
  }

  @override
  Future<List<CourseRM>> getUserCourses({
    required String keyword,
    required int? categoryId,
    required bool completed,
  }) async {
    final response = await apiCall<ApiDataResponse<MyCourseListResponse>>(
      () => _mtpRestClient.getUserCourses(
        keyword: keyword,
        categoryId: categoryId,
        status: completed ? 'completed' : 'on_going',
        include: LearningRestClientMixin.coursesIncludes.join(','),
      ),
    );
    return response.data.courses ?? [];
  }

  @override
  Future<CourseRM> getCourse({
    required int courseId,
  }) async {
    final response = await apiCall<ApiDataResponse<CourseRM>>(
      () => _mtpRestClient.getCourse(
        courseId: courseId,
        include: LearningRestClientMixin.courseIncludes.join(','),
      ),
    );
    return response.data;
  }

  @override
  Future<CourseRM> getUserCourse({
    required int courseId,
  }) async {
    final response = await apiCall<ApiDataResponse<CourseRM>>(
      () => _mtpRestClient.getUserCourse(
        courseId: courseId,
        include: LearningRestClientMixin.courseIncludes.join(','),
      ),
    );
    return response.data;
  }

  @override
  Future<XApiCourseRM> getXApiCourse({
    required int courseId,
  }) async {
    final response = await apiCall<XApiCourseRM>(
      () => _mtpRestClient.getXApiCourse(courseId: courseId),
    );
    return response;
  }

  @override
  Future<CourseLearnerRM> getCourseLearner({
    required int learnerId,
  }) async {
    final response = await apiCall<ApiDataResponse<CourseLearnerRM>>(
      () => _mtpRestClient.getCourseLearner(
        learnerId: learnerId,
      ),
    );
    return response.data;
  }

  @override
  Future<CourseLearnerRM> takeCourse({
    required int courseId,
  }) async {
    final response = await apiCall<ApiDataResponse<CourseLearnerRM>>(
      () => _mtpRestClient.takeCourse(courseId: courseId),
    );
    return response.data;
  }

  @override
  Future<LectureRM> getLecture({
    required int courseId,
    required int lectureId,
  }) async {
    final response = await apiCall<ApiDataResponse<LectureRM>>(
      () => _mtpRestClient.getLecture(
        lectureId: lectureId,
      ),
    );
    return response.data;
  }

  @override
  Future<LearningQuizRM> getLearningQuiz({
    required int courseId,
    required int quizId,
    required int userId,
  }) async {
    final response = await apiCall<ApiDataResponse<LearningQuizRM>>(
      () => _mtpRestClient.getLearningQuiz(
        quizId: quizId,
        includes: LearningRestClientMixin.quizIncludes.join(','),
      ),
    );

    final quiz = response.data;
    final questions = quiz.questions ?? [];
    final modifiedQuestionsById = <int, LearningQuizQuestionRM>{};
    if (quiz.type == LearningQuizTypeRM.assignment) {
      for (final question in questions) {
        final assignment = question.assignment;
        if (assignment != null && assignment.id != null) {
          final userAnswers = await apiCall<
              ApiDataResponse<List<LearningQuizAssignmentUserAnswerRM>>>(
            () => _mtpRestClient.getLearningQuizAssignmentUserAnswers(
              userId: userId,
              assignmentId: assignment.id!,
            ),
          );
          final userAnswer = userAnswers.data.firstOrNull;
          if (userAnswer != null) {
            final assignmentWithUserAnswer = assignment.copyWith(
              userAnswer: userAnswer,
            );
            modifiedQuestionsById[question.id!] = question.copyWith(
              assignment: assignmentWithUserAnswer,
            );
          }
        }
      }
    }

    return quiz.copyWith(
      questions: questions.map((question) {
        final modifiedQuestion = modifiedQuestionsById[question.id];
        return modifiedQuestion ?? question;
      }).toList(),
    );
  }

  @override
  Future<LiveSessionRM> getLiveSession({
    required int courseId,
    required int sessionId,
  }) async {
    final response = await apiCall<ApiDataResponse<LiveSessionRM>>(
      () => _mtpRestClient.getLiveSession(
        sessionId: sessionId,
      ),
    );
    return response.data;
  }

  @override
  Future<LearningSummaryRM> getLearningSummary({
    required int courseId,
    required int summaryId,
  }) async {
    final response = await apiCall<ApiDataResponse<LearningSummaryRM>>(
      () => _mtpRestClient.getLearningSummary(
        summaryId: summaryId,
      ),
    );
    return response.data;
  }

  @override
  Future<LearningActivityRM> getLearningActivity({
    required int courseId,
    required int activityId,
  }) async {
    final response = await apiCall<ApiDataResponse<LearningActivityRM>>(
      () => _mtpRestClient.getLearningActivity(
        activityId: activityId,
      ),
    );
    return response.data;
  }

  @override
  Future<EvaluationResponseRM> getEvaluation({
    required int courseId,
  }) async {
    final response = await apiCall<ApiDataResponse<EvaluationResponseRM>>(
      () => _mtpRestClient.getEvaluation(courseId: courseId),
    );
    return response.data;
  }

  @override
  Future<UpdateCompletionResponse> updateCompletion({
    required int courseId,
    required String currentSection,
    required String redirect,
  }) async {
    final response = await apiCall<UpdateCompletionResponse>(
      () => _mtpRestClient.updateCompletion(
        courseId: courseId,
        currentSection: currentSection,
        redirect: redirect,
      ),
    );
    return response;
  }

  @override
  Future<void> postQuizLongAnswer({
    required int courseId,
    required int quizId,
    required Map<int, String> answersById,
  }) async {
    for (final entry in answersById.entries) {
      await apiCall<ApiDataResponse<dynamic>>(
        () => _mtpRestClient.postQuizLongAnswer(
          courseId: courseId,
          quizId: quizId,
          longAnswerId: entry.key,
          answer: entry.value,
        ),
      );
    }
    return;
  }

  @override
  Future<void> postQuizShortAnswer({
    required int courseId,
    required int quizId,
    required Map<int, String> answersById,
  }) async {
    final body = <String, dynamic>{};
    for (var (index, entry) in answersById.entries.indexed) {
      body['answers[$index][short_answer_id]'] = entry.key;
      body['answers[$index][user_answer]'] = entry.value;
    }

    await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.postQuizShortAnswer(body: body),
    );
    return;
  }

  @override
  Future<ApiMessageDataResponse> postAssignment({
    required int courseId,
    required int quizId,
    required int assignmentId,
    required String redirect,
    required String currentSection,
    required File file,
  }) async {
    final result = await apiCall<ApiDataResponse<ApiMessageDataResponse>>(
      () => _mtpRestClient.postAssignment(
        courseId: courseId,
        quizId: quizId,
        assignmentId: assignmentId,
        redirect: redirect,
        currentSection: currentSection,
        file: file,
      ),
    );
    return result.data;
  }

  @override
  Future<List<AssessmentQuestionRM>> getAssessmentQuestions({
    required int courseId,
    required int userId,
  }) async {
    final response = await apiCall<ApiDataResponse<List<AssessmentQuestionRM>>>(
      () => _mtpRestClient.getAssessmentQuestions(courseId: courseId),
    );
    return response.data;
  }

  @override
  Future<AssessmentQuestionRM> getAssessmentQuestion({
    required int courseId,
    required int questionId,
    required int userId,
  }) async {
    final response = await apiCall<ApiDataResponse<AssessmentQuestionRM>>(
      () => _mtpRestClient.getAssessmentQuestion(
        questionId: questionId,
      ),
    );
    return response.data;
  }

  @override
  Future<AssessmentUserAnswerRM?> getAssessmentUserAnswer({
    required int courseId,
    required int assessmentQuestionId,
    required int userId,
  }) async {
    final response =
        await apiCall<ApiDataResponse<List<AssessmentUserAnswerRM>>>(
      () => _mtpRestClient.getAssessmentUserAnswers(
        courseId: courseId,
        assessmentQuestionId: assessmentQuestionId,
        userId: userId,
      ),
    );
    return response.data.firstOrNull;
  }

  @override
  Future<void> postAssessmentAnswer({
    required int courseId,
    required int assessmentQuestionId,
    required List<String> answers,
    required int userId,
  }) async {
    try {
      await apiCall<ApiDataResponse<dynamic>>(
        () => _mtpRestClient.postAssessmentAnswer(
          courseId: courseId,
          assessmentQuestionId: assessmentQuestionId,
          answers: answers,
        ),
      );
    } on ApiException catch (e, s) {
      logger.e("Error", e, s);

      if (e is ClientApiException && e.statusCode == 409) {
        final assessmentUserAnswerResponse =
            await apiCall<ApiDataResponse<List<AssessmentUserAnswerRM>>>(
          () => _mtpRestClient.getAssessmentUserAnswers(
            courseId: courseId,
            assessmentQuestionId: assessmentQuestionId,
            userId: userId,
          ),
        );
        final assessmentUserAnswers = assessmentUserAnswerResponse.data;
        final assessmentQuestionUserAnswerId =
            assessmentUserAnswers.firstOrNull?.id;
        if (assessmentQuestionUserAnswerId == null) {
          rethrow;
        }

        await putAssessmentAnswer(
          courseId: courseId,
          assessmentQuestionId: assessmentQuestionId,
          assessmentUserAnswerId: assessmentQuestionUserAnswerId,
          answers: answers,
        );

        return;
      }

      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> putAssessmentAnswer({
    required int courseId,
    required int assessmentQuestionId,
    required int assessmentUserAnswerId,
    required List<String> answers,
  }) async {
    await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.putAssessmentAnswer(
        courseId: courseId,
        assessmentId: assessmentQuestionId,
        assessmentUserAnswerId: assessmentUserAnswerId,
        answers: answers,
      ),
    );
  }

  @override
  Future<AssessmentSubmissionResultRM> submitAssessment({
    required int courseId,
  }) async {
    final result = await apiCall<ApiDataResponse<AssessmentSubmissionResultRM>>(
      () => _mtpRestClient.submitAssessment(courseId: courseId),
    );
    return result.data;
  }

  @override
  Future<String> postEvaluationAnswers({
    required int courseId,
    required List<String> answers,
  }) async {
    final response = await apiCall<ApiDataResponse<String>>(
      () => _mtpRestClient.postEvaluationAnswers(
        courseId: courseId,
        answers: answers,
      ),
    );
    return response.data;
  }

  @override
  Future<CertificateResponse> getCertificate({
    required int courseId,
  }) async {
    final response = await apiCall<CertificateResponse>(
      () => _mtpRestClient.getCertificate(courseId: courseId),
    );
    return response;
  }

  @override
  Future<void> cancelCourse({
    required int courseId,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.cancelCourse(courseId: courseId),
    );
  }

  @override
  Future<List<CourseReviewRM>> getCourseReviews({
    required int courseId,
  }) async {
    final response = await apiCall<ApiDataResponse<List<CourseReviewRM>>>(
      () => _mtpRestClient.getCourseReviews(courseId: courseId),
    );
    return response.data;
  }

  @override
  Future<List<CourseDiscussionMessageRM>> getCourseDiscussionMessages({
    required int courseId,
  }) async {
    final response =
        await apiCall<ApiDataResponse<List<CourseDiscussionMessageRM>>>(
      () => _mtpRestClient.getDiscussionMessages(courseId: courseId),
    );
    return response.data;
  }

  @override
  Future<void> createCourseReview({
    required int courseId,
    required int rating,
    required String remark,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.createCourseReview(
        courseId: courseId,
        rating: rating,
        remark: remark,
      ),
    );
  }

  @override
  Future<void> createDiscussionMessage({
    required int courseId,
    required int discussionId,
    required String message,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.createDiscussionMessage(
        courseId: courseId,
        discussionId: discussionId,
        message: message,
      ),
    );
  }

  //#endregion

  //#region Resource
  @override
  Future<List<ResourceRM>> getResources({
    required int page,
    required int limit,
    String? search,
    String? resourceFormat,
    String? subjectId,
    required String userType,
  }) async {
    final response = await apiCall<ApiDataResponse<List<ResourceRM>>>(
      () => _mtpRestClient.getResources(
        search: search,
        resourceFormat: resourceFormat,
        subjectId: subjectId,
        page: page,
        limit: limit,
        userType: userType,
      ),
    );
    return response.data;
  }

  @override
  Future<List<ResourceRM>> getResourcesByCourseId({
    required String courseId,
  }) async {
    final response = await apiCall<ApiDataResponse<List<ResourceRM>>>(
      () => _mtpRestClient.getResourcesByCourseId(courseId: courseId),
    );
    return response.data;
  }

  @override
  Future<List<ResourceFormatRM>> getResourceFormat() async {
    final response = await apiCall<ApiDataResponse<List<ResourceFormatRM>>>(
      () => _mtpRestClient.getResourceFormats(),
    );
    return response.data;
  }

  @override
  Future<List<SubjectRM>> getSubject() async {
    final response = await apiCall<ApiDataResponse<List<SubjectRM>>>(
      () => _mtpRestClient.getSubjects(),
    );
    return response.data;
  }

  @override
  Future<String> getChatGPTMessages({required String prompt}) {
    return _mtpRestClient.getChatGPTMessage(prompt: prompt);
  }

  @override
  Future<List<CommunityVideoRM>> getCommunityVideos(
      {required int page,
      required int limit,
      required String type,
      required int isPublished,
      String? search}) async {
    final response = await apiCall<ApiDataResponse<List<CommunityVideoRM>>>(
        () => _mtpRestClient.getCommunityVideos(
              // isPublished: isPublished,
              page: page,
              limit: limit,
              type: type,
              search: search,
            ));
    return response.data;
  }

  @override
  Future<CommunityVideoRM> getCommunityVideoById(
      {required int videoId, int? viewCount}) async {
    final response = await apiCall<ApiDataResponse<CommunityVideoRM>>(
        () => _mtpRestClient.getCommunityVideoById(
              id: videoId,
              viewCount: viewCount,
            ));
    return response.data;
  }

  @override
  Future<List<CommunityVideoRM>> getRelatedCommunityVideos(
      {required int id,
      required int limit,
      required String type,
      required int isPublished}) async {
    final response = await apiCall<ApiDataResponse<List<CommunityVideoRM>>>(
        () => _mtpRestClient.getRelatedCommunityVideos(
              id: id,
              limit: limit,
              type: type,
              // isPublished: isPublished
            ));
    return response.data;
  }

//#endregion

  //#region Thematic Group
  @override
  Future<List<ThematicGroupListingRM>> getUserGroups({
    required int page,
    required int pageSize,
    String? keyword,
    String? categories,
  }) async {
    final response =
        await apiCall<ApiPaginatedResponse<ThematicGroupListingRM>>(
      () => _mtpRestClient.getUserGroups(
        page: page,
        limit: pageSize,
        keyword: keyword,
        categories: categories?.isEmpty == true ? null : categories,
        include: ThematicGroupRestClientMixin.groupsIncludes.join(','),
      ),
    );
    return response.data;
  }

  @override
  Future<List<ThematicGroupListingRM>> getRecommendedGroups({
    required int page,
    required int pageSize,
    String? keyword,
    String? categories,
  }) async {
    final response =
        await apiCall<ApiPaginatedResponse<ThematicGroupListingRM>>(
      () => _mtpRestClient.getRecommendGroups(
        page: page,
        limit: pageSize,
        keyword: keyword,
        categories: categories?.isEmpty == true ? null : categories,
        include: ThematicGroupRestClientMixin.groupsIncludes.join(','),
      ),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupListingRM> getGroup({
    required String groupId,
  }) async {
    final response = await apiCall<ApiDataResponse<ThematicGroupListingRM>>(
      () => _mtpRestClient.getGroup(
        groupId: groupId,
        include: ThematicGroupRestClientMixin.groupsIncludes.join(','),
      ),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupRequestResponseRM> requestToJoinGroup({
    required String group_id,
    required String user_id,
    int? approval_status,
  }) async {
    final response =
        await apiCall<ApiDataResponse<ThematicGroupRequestResponseRM>>(
      () => _mtpRestClient.requestToJoinGroup(
          tgroup_id: group_id,
          user_id: user_id,
          approval_status: approval_status ?? 0),
    );
    return response.data;
  }

  @override
  Future<List<ThematicGroupPostRM>> getPostsList({
    int? page,
    int? pageSize,
    required String group_id,
  }) async {
    final response = await apiCall<ApiDataResponse<List<ThematicGroupPostRM>>>(
      () => _mtpRestClient.getPostsList(
          page: page, limit: pageSize, group_id: group_id, active: 1),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupPostCreateResponseRM> createPost({
    required String group_id,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final response =
        await apiCall<ApiDataResponse<ThematicGroupPostCreateResponseRM>>(
      () => _mtpRestClient.createPost(
          tgroupId: group_id,
          description: description,
          uploadedFile: uploadedFile,
          uploadedVideo: uploadedVideo),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupPostCreateResponseRM> editPost({
    required String post_id,
    required String group_id,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final response =
        await apiCall<ApiDataResponse<ThematicGroupPostCreateResponseRM>>(
      () => _mtpRestClient.EditPost(
          postId: post_id,
          tgroupId: group_id,
          description: description,
          uploadedFile: uploadedFile,
          uploadedVideo: uploadedVideo),
    );
    return response.data;
  }

  @override
  Future<List<ThematicGroupPostCommentRM>> getThematicGroupPostComments({
    required String post_id,
    required int page,
    required int pasgeSize,
  }) async {
    final response =
        await apiCall<ApiDataResponse<List<ThematicGroupPostCommentRM>>>(
      () => _mtpRestClient.getCommentsList(
          page: page, limit: pasgeSize, post_id: post_id),
    );
    return response.data;
  }

  @override
  Future<void> deleteThematicGroupPostComment({
    required String commentId,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.deleteComment(commentId: commentId.toIntOrThrow()),
    );
  }

  @override
  Future<void> deleteThematicGroupPostReply({
    required String replyId,
  }) async {
    await apiCall<dynamic>(
      () => _mtpRestClient.deleteReply(replyId: replyId.toIntOrThrow()),
    );
  }

  @override
  Future<ThematicGroupRulesResponseRM> getGroupRules() async {
    final response = await apiCall<ThematicGroupRulesResponseRM>(
      () => _mtpRestClient.getGroupRules(),
    );
    return response;
  }

  @override
  Future<List<ThematicGroupCategoryRM>> getCategories() async {
    final response =
        await apiCall<ApiDataResponse<List<ThematicGroupCategoryRM>>>(
      () => _mtpRestClient.getCategories(),
    );
    return response.data;
  }

  @override
  Future<ReactionRM> createThematicGroupReaction({
    required ReactionTypeRM reactionType,
    required String reactionToType,
    required int reactionToId,
    required int groupId,
  }) async {
    final response = await apiCall<ApiDataResponse<ReactionRM>>(
      () => _mtpRestClient.createThematicGroupReaction(
          groupId: groupId.toString(),
          reactionType: reactionType.toJson(),
          reactionToType: reactionToType,
          reactionToId: reactionToId.toString()),
    );
    return response.data;
  }

  @override
  Future<ReactionRM> updateThematicGroupReaction({
    required int reactionId,
    required ReactionTypeRM reactionType,
  }) async {
    final response = await apiCall<ApiDataResponse<ReactionRM>>(
      () => _mtpRestClient.updateThematicGroupReaction(
          reactionId: reactionId, reactionType: reactionType.toJson()),
    );
    return response.data;
  }

  @override
  Future<void> deleteThematicGroupReaction({
    required int reactionId,
  }) async {
    await apiCall<dynamic>(() => _mtpRestClient.deleteThematicGroupReaction(
          reactionId: reactionId,
        ));
  }

  @override
  Future<ThematicGroupPostCommentRM> createThematicGroupPostComment({
    required int postId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final response = await apiCall<ApiDataResponse<ThematicGroupPostCommentRM>>(
      () => _mtpRestClient.createPostComment(
        tgroup_post_id: postId.toString(),
        description: description,
        uploadedImage: uploadedFile,
        uploadedVideo: uploadedVideo,
      ),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupPostCommentRM> updateThematicGroupPostComment({
    required int commentId,
    required int postId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final response = await apiCall<ApiDataResponse<ThematicGroupPostCommentRM>>(
      () => _mtpRestClient.updatePostComment(
        commentId: commentId,
        description: description,
      ),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupPostCommentReplyRM> createThematicGroupPostPostReply({
    required int commentId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final response =
        await apiCall<ApiDataResponse<ThematicGroupPostCommentReplyRM>>(
      () => _mtpRestClient.createThematicGroupPostReply(
        description: description,
        comment_id: commentId.toString(),
        reply_id: commentId.toString(),
        uploadedImage: uploadedFile,
        uploadedVideo: uploadedVideo,
      ),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupPostCommentReplyRM> updateThematicGroupPostPostReply({
    required int replyId,
    required int commentId,
    required String description,
    File? uploadedFile,
    File? uploadedVideo,
  }) async {
    final response =
        await apiCall<ApiDataResponse<ThematicGroupPostCommentReplyRM>>(
      () => _mtpRestClient.updateThematicGroupPostReply(
        replyId: replyId,
        description: description,
      ),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupPostCreateResponseRM> deleteGroupPost({
    required int postId,
  }) async {
    final response =
        await apiCall<ApiDataResponse<ThematicGroupPostCreateResponseRM>>(
      () => _mtpRestClient.deleteGroupPost(
        postId: postId,
      ),
    );
    return response.data;
  }

  @override
  Future<String> leaveGroup({
    required int groupId,
  }) async {
    final response = await apiCall<ApiDataResponse<String>>(
      () => _mtpRestClient.leaveGroup(groupId: groupId, leaveOption: "1"),
    );
    return response.data;
  }

  @override
  Future<GroupPostDetailsDataRM> getPostDetails({
    required String postId,
    required String includes,
  }) async {
    final response = await apiCall<ApiDataResponse<GroupPostDetailsDataRM>>(
      () => _mtpRestClient.getPostDetails(postId: postId, include: includes),
    );
    return response.data;
  }

  //#endregion

  //#region Notification
  @override
  Future<NotificationListResponse> getNotificationListResponse() async {
    final response = await apiCall<NotificationListResponse>(
      () => _mtpRestClient.getNotificationsData(),
    );
    return response;
  }

  @override
  Future<FcmTokenResponseRM> updateFcmToken({required String token}) async {
    final response = await apiCall<FcmTokenResponseRM>(
      () => _mtpRestClient.setFcmToken(token: token),
    );
    return response;
  }

  @override
  Future<NotificationDetailResponseRM> getNotificationDetail(
      {required String notiId}) async {
    final response = await apiCall<NotificationDetailResponseRM>(
      () => _mtpRestClient.getNotificationDetail(
        notiId: notiId,
      ),
    );
    return response;
  }

  //#endregion

  @override
  Future<HomePageVideoRM> getHomePageVideo() async {
    final response = await apiCall<ApiDataResponse<HomePageVideoRM>>(
        () => _mtpRestClient.getHomePageVideo());
    return response.data;
  }

  @override
  Future<Version> getCurrentVersion() async {
    final response = await apiCall<ApiDataResponse<Version>>(
        () => _mtpRestClient.getCurrentVersion());
    return response.data;
  }

  @override
  Future<OfflineContentRM> getOfflineContent() async {
    final response = await apiCall<ApiDataResponse<OfflineContentRM>>(
        () => _mtpRestClient.getOfflineContent());
    return response.data;
  }

  @override
  Future<List<SlideRM>> getSlides() async {
    final response = await apiCall<ApiDataResponse<List<SlideRM>>>(
        () => _mtpRestClient.getSlides());
    return response.data;
  }

  @override
  Future<ApiPaginatedResponse<ThematicGroupPostRM>> getGroupApprovedPosts({
    required int groupId,
    required int userId,
    required int page,
    required int limit,
  }) async {
    final response = await apiCall<ApiPaginatedResponse<ThematicGroupPostRM>>(
        () => _mtpRestClient.getGroupApprovedPosts(
              groupId: groupId,
              userId: userId,
              page: page,
              limit: limit,
            ));
    return response;
  }

  @override
  Future<List<ThematicGroupPostRM>> getGroupPendingPosts({
    required int groupId,
    required int userId,
    required int page,
    required int limit,
  }) async {
    final response = await apiCall<ApiDataResponse<List<ThematicGroupPostRM>>>(
      () => _mtpRestClient.getGroupPendingPosts(
        groupId: groupId,
        userId: userId,
        page: page,
        limit: limit,
      ),
    );
    return response.data;
  }

  @override
  Future<ThematicGroupPostRM> getGroupPost({
    required int postId,
  }) async {
    final response = await apiCall<ApiDataResponse<ThematicGroupPostRM>>(
      () => _mtpRestClient.getGroupPost(
        postId: postId,
      ),
    );
    return response.data;
  }

  //#endregion

  //#region Contact Us
  @override
  Future<ContactInfoRM> getContactInfo() async {
    final response = await apiCall<ApiDataResponse<ContactInfoRM>>(
      () => _mtpRestClient.getContactInfo(),
    );
    return response.data;
  }

  @override
  Future<List<ContactRegionRM>> getContactRegions() async {
    final response = await apiCall<ApiDataResponse<dynamic>>(
      () => _mtpRestClient.getContactRegions(),
    );

    final data = response.data;
    final regions = <ContactRegionRM>[];
    if (data is Map) {
      for (final entry in data.entries) {
        final region = ContactRegionRM(
          id: int.tryParse(entry.key?.toString() ?? ''),
          name: entry.value,
        );
        regions.add(region);
      }
    }
    return regions;
  }

  @override
  Future<String> sendContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String phone,
    required String organization,
    required int? regionId,
  }) async {
    final response = await apiCall<ApiMessageDataResponse<dynamic>>(
      () => _mtpRestClient.sendContactMessage(
        name: name,
        email: email,
        subject: subject,
        message: message,
        phone: phone,
        organization: organization,
        regionId: regionId,
      ),
    );
    return response.message ?? '';
  }

  //#endregion

  //#region User Manual
  @override
  Future<List<UserManualRM>> getUserManuals() async {
    final response = await apiCall<ApiDataResponse<UserManualResponseRM>>(
      () => _mtpRestClient.getUserManuals(),
    );
    final manuals = <UserManualRM>[];
    if (response.data.webUserManuals != null) {
      manuals.addAll(response.data.webUserManuals!);
    }
    if (response.data.mobileUserManuals != null) {
      manuals.addAll(response.data.mobileUserManuals!);
    }
    return manuals;
  }

  @override
  Future<List<CmsMenuRM>> getCmsMenus() async {
    final response = await apiCall<ApiDataResponse<List<CmsMenuRM>>>(
      () => _mtpRestClient.getCmsMenus(),
    );
    return response.data;
  }
//#endregion
}
