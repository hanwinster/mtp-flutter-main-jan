import 'dart:io';

import 'package:api/api.dart';

abstract class LearningApi {
  Future<List<CourseCategoryRM>> getCourseCategories();

  Future<List<CourseRM>> getCourses({
    required String keyword,
    required int? categoryId,
    required int page,
    required int limit,
  });

  Future<List<CourseRM>> getUserCourses({
    required String keyword,
    required int? categoryId,
    required bool completed,
  });

  Future<CourseRM> getCourse({
    required int courseId,
  });

  Future<CourseRM> getUserCourse({
    required int courseId,
  });

  Future<XApiCourseRM> getXApiCourse({
    required int courseId,
  });

  Future<CourseLearnerRM> getCourseLearner({
    required int learnerId,
  });

  Future<CourseLearnerRM> takeCourse({
    required int courseId,
  });

  Future<LectureRM> getLecture({
    required int courseId,
    required int lectureId,
  });

  Future<LearningQuizRM> getLearningQuiz({
    required int courseId,
    required int quizId,
    required int userId,
  });

  Future<LearningSummaryRM> getLearningSummary({
    required int courseId,
    required int summaryId,
  });

  Future<LearningActivityRM> getLearningActivity({
    required int courseId,
    required int activityId,
  });

  Future<LiveSessionRM> getLiveSession({
    required int courseId,
    required int sessionId,
  });

  Future<EvaluationResponseRM> getEvaluation({
    required int courseId,
  });

  Future<UpdateCompletionResponse> updateCompletion({
    required int courseId,
    required String currentSection,
    required String redirect,
  });

  Future<void> postQuizLongAnswer({
    required int courseId,
    required int quizId,
    required Map<int, String> answersById,
  });

  Future<void> postQuizShortAnswer({
    required int courseId,
    required int quizId,
    required Map<int, String> answersById,
  });

  Future<ApiMessageDataResponse> postAssignment({
    required int courseId,
    required int quizId,
    required int assignmentId,
    required String redirect,
    required String currentSection,
    required File file,
  });

  Future<List<AssessmentQuestionRM>> getAssessmentQuestions({
    required int courseId,
    required int userId,
  });

  Future<AssessmentQuestionRM> getAssessmentQuestion({
    required int courseId,
    required int questionId,
    required int userId,
  });

  Future<AssessmentUserAnswerRM?> getAssessmentUserAnswer({
    required int courseId,
    required int assessmentQuestionId,
    required int userId,
  });

  Future<void> postAssessmentAnswer({
    required int courseId,
    required int assessmentQuestionId,
    required List<String> answers,
    required int userId,
  });

  Future<void> putAssessmentAnswer({
    required int courseId,
    required int assessmentQuestionId,
    required int assessmentUserAnswerId,
    required List<String> answers,
  });

  Future<AssessmentSubmissionResultRM> submitAssessment({
    required int courseId,
  });

  Future<String> postEvaluationAnswers({
    required int courseId,
    required List<String> answers,
  });

  Future<CertificateResponse> getCertificate({
    required int courseId,
  });

  Future<void> cancelCourse({
    required int courseId,
  });

  Future<List<CourseReviewRM>> getCourseReviews({
    required int courseId,
  });

  Future<List<CourseDiscussionMessageRM>> getCourseDiscussionMessages({
    required int courseId,
  });

  Future<void> createCourseReview({
    required int courseId,
    required int rating,
    required String remark,
  });

  Future<void> createDiscussionMessage({
    required int courseId,
    required int discussionId,
    required String message,
  });
}
