import 'package:api/api.dart';
import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
final class CourseRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'objective')
  final String? objective;
  @JsonKey(name: 'learning_outcome')
  final String? learningOutcome;
  @JsonKey(name: 'cover_images')
  final ImageUrlRM? coverImageUrl;
  @JsonKey(name: 'url_link')
  final String? urlLink;
  @JsonKey(name: 'is_display_video')
  final dynamic isDisplayVideo;
  @JsonKey(name: 'video_link')
  final String? videoUrl;
  @JsonKey(name: 'categories')
  final List<CourseCategoryRM>? categories;
  @JsonKey(
    name: 'downloadable_option',
    unknownEnumValue: CourseDownloadableOptionRM.unknown,
  )
  final CourseDownloadableOptionRM? downloadableOption;
  @JsonKey(name: 'level')
  final CourseLevelRM? courseLevel;
  @JsonKey(name: 'type')
  final CourseTypeRM? courseType;
  @JsonKey(name: 'allow_feedback')
  final int? isAllowFeedback;
  @JsonKey(name: 'allow_discussion')
  final int? isAllowDiscussion;
  @JsonKey(name: 'discussion')
  final CourseDiscussionRM? discussion;
  @JsonKey(name: 'acceptable_score_for_assignment')
  final int? acceptableScoreForAssignment;
  @JsonKey(name: 'acceptable_score_for_assessment')
  final int? acceptableScoreForAssessment;
  @JsonKey(name: 'estimated_duration')
  final int? estimatedDuration;
  @JsonKey(
      name: 'estimated_duration_unit',
      unknownEnumValue: CourseDurationUnitRM.unknown)
  final CourseDurationUnitRM? estimatedDurationUnit;
  @JsonKey(name: 'enrollments')
  final int? numberOfEnrollments;
  @JsonKey(name: 'total_lectures')
  final int? totalLectures;
  @JsonKey(name: 'total_quizzes')
  final int? totalQuizzes;
  @JsonKey(name: 'view_count')
  final int? viewCount;
  @JsonKey(name: 'final_rating')
  final num? rating;
  @JsonKey(name: 'evaluation_message')
  final String? evaluationMessage;
  @JsonKey(
      name: 'order_type', unknownEnumValue: CourseMaterialOrderTypeRM.unknown)
  final CourseMaterialOrderTypeRM? courseOrderType;
  @JsonKey(
      name: 'lecture_order_type',
      unknownEnumValue: CourseMaterialOrderTypeRM.unknown)
  final CourseMaterialOrderTypeRM? lectureOrderType;
  @JsonKey(name: 'ordered')
  final List<CourseMaterialRM>? courseOrder;
  @JsonKey(name: 'lecture_orders')
  final List<dynamic>? lectureOrder;
  @JsonKey(name: 'course_learner')
  final CourseLearnerRM? courseLearner;
  @JsonKey(name: 'learner')
  final CourseLearnerRM? learner;
  @JsonKey(name: 'is_xapi_course')
  final dynamic isXapiCourse;
  @JsonKey(name: 'resource_file')
  final String? resourceFileUrl;
  @JsonKey(name: 'user')
  final UserRM? createdBy;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'is_user_taken_this_course')
  final bool? hasUserTakenCourse;
  @JsonKey(name: 'lectures')
  final List<LectureRM>? lectures;
  @JsonKey(name: 'quizzes')
  final List<LearningQuizRM>? quizzes;
  @JsonKey(name: 'summaries')
  final List<LearningSummaryRM>? summaries;
  @JsonKey(name: 'learning_activities')
  final List<LearningActivityRM>? learningActivities;
  @JsonKey(name: 'live_sessions')
  final List<LiveSessionRM>? liveSessions;
  @JsonKey(name: 'assessment_question_answers')
  final List<AssessmentQuestionRM>? assessmentQuestions;
  @JsonKey(name: 'user_can_access')
  final bool? isUserCanAccess;

  const CourseRM({
    this.id,
    this.title,
    this.description,
    this.objective,
    this.learningOutcome,
    this.coverImageUrl,
    this.urlLink,
    this.isDisplayVideo,
    this.videoUrl,
    this.categories,
    this.downloadableOption,
    this.courseLevel,
    this.courseType,
    this.isAllowFeedback,
    this.isAllowDiscussion,
    this.discussion,
    this.acceptableScoreForAssignment,
    this.acceptableScoreForAssessment,
    this.estimatedDuration,
    this.estimatedDurationUnit,
    this.numberOfEnrollments,
    this.totalLectures,
    this.totalQuizzes,
    this.viewCount,
    this.rating,
    this.evaluationMessage,
    this.courseOrderType,
    this.lectureOrderType,
    this.courseOrder,
    this.lectureOrder,
    this.courseLearner,
    this.learner,
    this.isXapiCourse,
    this.resourceFileUrl,
    this.createdBy,
    this.createdAt,
    this.hasUserTakenCourse,
    this.lectures,
    this.quizzes,
    this.liveSessions,
    this.summaries,
    this.learningActivities,
    this.assessmentQuestions,
    this.isUserCanAccess,
  });

  @override
  List<Object?> get props =>
      [
        id,
        title,
        description,
        objective,
        learningOutcome,
        coverImageUrl,
        urlLink,
        isDisplayVideo,
        videoUrl,
        categories,
        downloadableOption,
        courseLevel,
        courseType,
        isAllowFeedback,
        isAllowDiscussion,
        discussion,
        acceptableScoreForAssignment,
        acceptableScoreForAssessment,
        estimatedDuration,
        estimatedDurationUnit,
        numberOfEnrollments,
        totalLectures,
        totalQuizzes,
        viewCount,
        rating,
        evaluationMessage,
        courseOrderType,
        lectureOrderType,
        courseOrder,
        lectureOrder,
        courseLearner,
        learner,
        isXapiCourse,
        resourceFileUrl,
        createdBy,
        createdAt,
        hasUserTakenCourse,
        lectures,
        quizzes,
        summaries,
        learningActivities,
        liveSessions,
        assessmentQuestions,
        isUserCanAccess,
      ];

  factory CourseRM.fromJson(Map<String, dynamic> json) =>
      _$CourseRMFromJson(json);

  Course toDomainModel() {
    return Course(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      title: title ?? '',
      description: description ?? '',
      objective: objective ?? '',
      learningOutcome: learningOutcome ?? '',
      coverImage: coverImageUrl?.toDomainModel() ?? ImageUrl.empty(),
      urlLink: urlLink ?? '',
      isDisplayVideo: isDisplayVideo == 1,
      videoUrl: videoUrl ?? '',
      categories: categories?.map((e) => e.toDomainModel()).toList() ?? [],
      downloadableOption: downloadableOption?.toDomainModel() ??
          CourseDownloadableOption.unknown,
      courseLevel: courseLevel?.toDomainModel() ??
          (throw ('courseLevel must not be null')),
      courseType: courseType?.toDomainModel() ??
          (throw ('courseType must not be null')),
      isAllowFeedback: isAllowFeedback == 1,
      isAllowDiscussion: isAllowDiscussion == 1,
      discussion: discussion?.toDomainModel(),
      acceptableScoreForAssignment: acceptableScoreForAssignment ?? 0,
      acceptableScoreForAssessment: acceptableScoreForAssessment ?? 0,
      estimatedDuration: _mapDuration(),
      numberOfEnrollments: numberOfEnrollments ?? 0,
      totalLectures: totalLectures ?? 0,
      totalQuizzes: totalQuizzes ?? 0,
      viewCount: viewCount ?? 0,
      rating: rating?.toDouble() ?? 0,
      evaluationMessage: evaluationMessage ?? '',
      courseOrderType:
      courseOrderType?.toDomainModel() ?? CourseMaterialOrderType.unknown,
      lectureOrderType:
      lectureOrderType?.toDomainModel() ?? CourseMaterialOrderType.unknown,
      courseOrder: courseOrder?.map((e) => e.toDomainModel()).toList() ?? [],
      lectureOrderByLectureId: _mapLectureOrder(),
      courseLearner: courseLearner?.toDomainModel() ?? learner?.toDomainModel(),
      isXapiCourse: isXapiCourse == 1,
      resourceFileUrl: resourceFileUrl ?? '',
      createdBy: createdBy?.toDomainModel(),
      createdAt: createdAt ?? DateTime.now(),
      hasUserTakenCourse: hasUserTakenCourse ?? false,
      isUserCanAccessCourse: isUserCanAccess ?? false,
      lectures: lectures
          ?.map(
            (e) =>
            e.toDomainModel().copyWith(
              quizzes: quizzes
                  ?.where((s) => s.lectureId == e.id)
                  .map((e) => e.toDomainModel())
                  .toList() ??
                  [],
              learningActivities: learningActivities
                  ?.where((s) => s.lectureId == e.id)
                  .map((e) => e.toDomainModel())
                  .toList() ??
                  [],
              summaries: summaries
                  ?.where((s) => s.lectureId == e.id)
                  .map((e) => e.toDomainModel())
                  .toList() ??
                  [],
              liveSessions: liveSessions
                  ?.where((s) => s.lectureId == e.id)
                  .map((e) => e.toDomainModel())
                  .toList() ??
                  [],
            ),
      )
          .toList() ??
          [],
      quizzes: quizzes
          ?.where((e) => e.lectureId == null)
          .map((e) => e.toDomainModel())
          .toList() ??
          [],
      summaries: summaries
          ?.where((e) => e.lectureId == null)
          .map((e) => e.toDomainModel())
          .toList() ??
          [],
      learningActivities: learningActivities
          ?.where((e) => e.lectureId == null)
          .map((e) => e.toDomainModel())
          .toList() ??
          [],
      liveSessions: liveSessions
          ?.where((e) => e.lectureId == null)
          .map((e) => e.toDomainModel())
          .toList() ??
          [],
      assessmentQuestions:
      assessmentQuestions?.map((e) => e.toDomainModel()).toList() ?? [],
    );
  }

  CourseDuration _mapDuration() {
    return CourseDuration(
      duration: estimatedDuration ?? 0,
      unit:
      estimatedDurationUnit?.toDomainModel() ?? CourseDurationUnit.unknown,
    );
  }

  Map<String, List<String>> _mapLectureOrder() {
    if (lectureOrder == null) {
      return {};
    }

    final result = <String, List<String>>{};
    for (final item in lectureOrder!) {
      if (item is Map<dynamic, dynamic>) {
        final key = item.keys.first;
        final value = item.values.first;
        if (value is List) {
          result[key.toString()] = value.map((e) => e.toString()).toList();
        }
      }
    }
    return result;
  }
}
