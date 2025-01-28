import 'dart:io';

import 'package:api/api.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_api/src/retrofit/mtp_rest_client.dart';

mixin LearningRestClientMixin {
  static List<String> quizIncludes = [
    'questions',
    'questions.assignment',
    'questions.blank_answer',
    'questions.long_answer',
    'questions.matching_answer',
    'questions.multiple_answers',
    'questions.rearrange_answer',
    'questions.short_answer',
    'questions.true_false_answer',
  ];

  static List<String> coursesIncludes = [
    'categories',
    'level',
    'type',
    'learner',
  ];

  static List<String> courseIncludes = [
    'categories',
    'level',
    'type',
    'learner',
    'lectures',
    'learningActivities',
    'quizzes',
    'liveSessions',
    'summaries',
    'interactiveFeatures',
    'discussion',
    'assessmentQuestionAnswers',
    'assessmentQuestionAnswers.assessment_user',
    'assessmentQuestionAnswers.current_assessment_user',
  ];

  @GET('/course-categories')
  @PublicApi()
  Future<ApiDataResponse<List<CourseCategoryRM>>> getCourseCategories();

  @GET('/courses')
  Future<ApiDataResponse<List<CourseRM>>> getCourses({
    @Query('search[value]') required String keyword,
    @Query('course_categories') required int? categoryId,
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('include') required String include,
    @Query('is_published') int isPublished = 1,
    @Query('approval_status') int approvalStatus = 1,
    @Query('sort[0][field]') String sort = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @GET('/courses/my-courses')
  Future<ApiDataResponse<MyCourseListResponse>> getUserCourses({
    @Query('search') required String keyword,
    @Query('course_categories') required int? categoryId,
    @Query('progress') required String status,
    @Query('include') required String include,
    @Query('is_published') int isPublished = 1,
    @Query('approval_status') int approvalStatus = 1,
    @Query('sort[0][field]') String sort = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @GET('/courses/{courseId}')
  Future<ApiDataResponse<CourseRM>> getCourse({
    @Path('courseId') required int courseId,
    @Query('include') required String include,
    @Query('with') String withParams = 'ordered,info',
  });

  @GET('/courses/{courseId}')
  Future<ApiDataResponse<CourseRM>> getUserCourse({
    @Path('courseId') required int courseId,
    @Query('include') required String include,
    @Query('with') String withParams = 'ordered,info',
    @Query('_auth') int auth = 1,
  });

  @GET('/courses/{courseId}/get-completion-status-from-sc')
  Future<XApiCourseRM> getXApiCourse({
    @Path('courseId') required int courseId,
  });

  @GET('/course-learners/{learnerId}')
  Future<ApiDataResponse<CourseLearnerRM>> getCourseLearner({
    @Path('learnerId') required int learnerId,
  });

  @POST('/courses/take-course/{courseId}')
  Future<ApiDataResponse<CourseLearnerRM>> takeCourse({
    @Path('courseId') required int courseId,
  });

  @GET('/lectures/{lecture_id}')
  Future<ApiDataResponse<LectureRM>> getLecture({
    @Path('lecture_id') required int lectureId,
    @Query('include') String include = 'interactiveFeatures',
  });

  @GET('/learning-activities/{activity_id}')
  Future<ApiDataResponse<LearningActivityRM>> getLearningActivity({
    @Path('activity_id') required int activityId,
    @Query('include') String include = 'interactiveFeatures',
  });

  @GET('/quizzes/{quiz_id}')
  Future<ApiDataResponse<LearningQuizRM>> getLearningQuiz({
    @Path('quiz_id') required int quizId,
    @Query('include') required String includes,
  });

  @GET('/assignment-users')
  Future<ApiDataResponse<List<LearningQuizAssignmentUserAnswerRM>>>
      getLearningQuizAssignmentUserAnswers({
    @Query('user_id') required int userId,
    @Query('assignment_id') required int assignmentId,
  });

  @GET('/summaries/{summary_id}')
  Future<ApiDataResponse<LearningSummaryRM>> getLearningSummary({
    @Path('summary_id') required int summaryId,
    @Query('include') String include = 'interactiveFeatures',
  });

  @GET('/live-sessions/{session_id}')
  Future<ApiDataResponse<LiveSessionRM>> getLiveSession({
    @Path('session_id') required int sessionId,
  });

  @GET('/evaluation-users/evaluations/{course_id}')
  Future<ApiDataResponse<EvaluationResponseRM>> getEvaluation({
    @Path('course_id') required int courseId,
  });

  @GET('/assessment-question-answers')
  Future<ApiDataResponse<List<AssessmentQuestionRM>>> getAssessmentQuestions({
    @Query('course_id') required int courseId,
    @Query('limit') int limit = 99999,
    @Query('include') String include = 'current_assessment_user',
  });

  @GET('/assessment-question-answers/{question_id}')
  Future<ApiDataResponse<AssessmentQuestionRM>> getAssessmentQuestion({
    @Path('question_id') required int questionId,
    @Query('include') String include = 'current_assessment_user',
  });

  @POST('/courses/update-completion/{course_id}')
  Future<UpdateCompletionResponse> updateCompletion({
    @Path('course_id') required int courseId,
    @Field('current_section') required String currentSection,
    @Field('redirect') required String redirect,
  });

  @POST('/courses/{course_id}/quizzes/{quiz_id}/submit-long-answer')
  @FormUrlEncoded()
  Future<ApiDataResponse<dynamic>> postQuizLongAnswer({
    @Path('course_id') required int courseId,
    @Path('quiz_id') required int quizId,
    @Field('long_answer_id') required int longAnswerId,
    @Field('answers') required String answer,
  });

  @POST('/courses/submit-short-answer')
  @FormUrlEncoded()
  Future<ApiDataResponse<dynamic>> postQuizShortAnswer({
    @Body() required Map<String, dynamic> body,
  });

  @POST('/courses/{course_id}/quizzes/{quiz_id}/submit-assignment')
  Future<ApiDataResponse<ApiMessageDataResponse>> postAssignment({
    @Path('course_id') required int courseId,
    @Path('quiz_id') required int quizId,
    @Part(name: "assignment_id") required int assignmentId,
    @Part(name: "redirect") required String redirect,
    @Part(name: 'current_section') required String currentSection,
    @Part(name: "assignment_file") required File file,
  });

  @POST('/course/{course_id}/assessments/{assessment_id}/save')
  Future<ApiDataResponse<dynamic>> postAssessmentAnswer({
    @Path('course_id') required int courseId,
    @Path('assessment_id') required int assessmentQuestionId,
    @Field('answers') required List<String> answers,
  });

  @PUT('/course/{course_id}/assessments/{assessment_id}/update')
  Future<ApiDataResponse<dynamic>> putAssessmentAnswer({
    @Path('course_id') required int courseId,
    @Path('assessment_id') required int assessmentId,
    @Field('id') required int assessmentUserAnswerId,
    @Field('answers') required List<String> answers,
  });

  @GET('/assessment-users')
  Future<ApiDataResponse<List<AssessmentUserAnswerRM>>>
      getAssessmentUserAnswers({
    @Query('course_id') required int courseId,
    @Query('assessment_question_answer_id') required int assessmentQuestionId,
    @Query('user_id') required int userId,
  });

  @POST('/course/{course_id}/assessments/submit')
  Future<ApiDataResponse<AssessmentSubmissionResultRM>> submitAssessment({
    @Path('course_id') required int courseId,
  });

  @POST('/courses/{course_id}/evaluations/submit')
  @FormUrlEncoded()
  Future<ApiDataResponse<String>> postEvaluationAnswers({
    @Path('course_id') required int courseId,
    @Field('feedbacks[]') required List<String> answers,
  });

  @GET('/courses/{course_id}/generate-certi')
  Future<CertificateResponse> getCertificate({
    @Path('course_id') required int courseId,
  });

  @POST('/courses/{course_id}/cancel-course')
  Future<dynamic> cancelCourse({
    @Path('course_id') required int courseId,
  });

  @GET('/rating-reviews')
  Future<ApiDataResponse<List<CourseReviewRM>>> getCourseReviews({
    @Query('course_id') required int courseId,
    @Query('include') String include = 'user',
    @Query('limit') int limit = 99999,
    @Query('sort[0][field]') String sort = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @GET('/discussion-messages')
  Future<ApiDataResponse<List<CourseDiscussionMessageRM>>>
      getDiscussionMessages({
    @Query('discussion->course_id') required int courseId,
    @Query('include') String include = 'user',
    @Query('limit') int limit = 99999,
    @Query('sort[0][field]') String sort = 'created_at',
    @Query('sort[0][direction]') String direction = 'desc',
  });

  @POST('/rating-reviews')
  @FormUrlEncoded()
  Future<ApiDataResponse<dynamic>> createCourseReview({
    @Field('course_id') required int courseId,
    @Field('rating') required int rating,
    @Field('remark') required String remark,
  });

  @POST('/discussion-messages')
  @FormUrlEncoded()
  Future<ApiDataResponse<dynamic>> createDiscussionMessage({
    @Field('course_id') required int courseId,
    @Field('discussion_id') required int discussionId,
    @Field('message') required String message,
  });
}
