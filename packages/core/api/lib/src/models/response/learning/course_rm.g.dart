// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRM _$CourseRMFromJson(Map<String, dynamic> json) => CourseRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      objective: json['objective'] as String?,
      learningOutcome: json['learning_outcome'] as String?,
      coverImageUrl: json['cover_images'] == null
          ? null
          : ImageUrlRM.fromJson(json['cover_images'] as Map<String, dynamic>),
      urlLink: json['url_link'] as String?,
      isDisplayVideo: json['is_display_video'],
      videoUrl: json['video_link'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CourseCategoryRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      downloadableOption: json['downloadable_option'] == null
          ? null
          : CourseDownloadableOptionRM.fromJson(
              (json['downloadable_option'] as num).toInt()),
      courseLevel: json['level'] == null
          ? null
          : CourseLevelRM.fromJson(json['level'] as Map<String, dynamic>),
      courseType: json['type'] == null
          ? null
          : CourseTypeRM.fromJson(json['type'] as Map<String, dynamic>),
      isAllowFeedback: (json['allow_feedback'] as num?)?.toInt(),
      isAllowDiscussion: (json['allow_discussion'] as num?)?.toInt(),
      discussion: json['discussion'] == null
          ? null
          : CourseDiscussionRM.fromJson(
              json['discussion'] as Map<String, dynamic>),
      acceptableScoreForAssignment:
          (json['acceptable_score_for_assignment'] as num?)?.toInt(),
      acceptableScoreForAssessment:
          (json['acceptable_score_for_assessment'] as num?)?.toInt(),
      estimatedDuration: (json['estimated_duration'] as num?)?.toInt(),
      estimatedDurationUnit: json['estimated_duration_unit'] == null
          ? null
          : CourseDurationUnitRM.fromJson(
              json['estimated_duration_unit'] as String),
      numberOfEnrollments: (json['enrollments'] as num?)?.toInt(),
      totalLectures: (json['total_lectures'] as num?)?.toInt(),
      totalQuizzes: (json['total_quizzes'] as num?)?.toInt(),
      viewCount: (json['view_count'] as num?)?.toInt(),
      rating: json['final_rating'] as num?,
      evaluationMessage: json['evaluation_message'] as String?,
      courseOrderType: json['order_type'] == null
          ? null
          : CourseMaterialOrderTypeRM.fromJson(json['order_type'] as String),
      lectureOrderType: json['lecture_order_type'] == null
          ? null
          : CourseMaterialOrderTypeRM.fromJson(
              json['lecture_order_type'] as String),
      courseOrder: (json['ordered'] as List<dynamic>?)
          ?.map((e) => CourseMaterialRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      lectureOrder: json['lecture_orders'] as List<dynamic>?,
      courseLearner: json['course_learner'] == null
          ? null
          : CourseLearnerRM.fromJson(
              json['course_learner'] as Map<String, dynamic>),
      learner: json['learner'] == null
          ? null
          : CourseLearnerRM.fromJson(json['learner'] as Map<String, dynamic>),
      isXapiCourse: json['is_xapi_course'],
      resourceFileUrl: json['resource_file'] as String?,
      createdBy: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      hasUserTakenCourse: json['is_user_taken_this_course'] as bool?,
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => LectureRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      quizzes: (json['quizzes'] as List<dynamic>?)
          ?.map((e) => LearningQuizRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      liveSessions: (json['live_sessions'] as List<dynamic>?)
          ?.map((e) => LiveSessionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      summaries: (json['summaries'] as List<dynamic>?)
          ?.map((e) => LearningSummaryRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      learningActivities: (json['learning_activities'] as List<dynamic>?)
          ?.map((e) => LearningActivityRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      assessmentQuestions: (json['assessment_question_answers']
              as List<dynamic>?)
          ?.map((e) => AssessmentQuestionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      isUserCanAccess: json['user_can_access'] as bool?,
    );
