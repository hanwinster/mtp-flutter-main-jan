import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

final class CourseEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String objective;
  final String learningOutcome;
  final ImageUrlEntity coverImage;
  final String urlLink;
  final bool isDisplayVideo;
  final String videoUrl;
  final List<CourseCategoryEntity> categories;
  final CourseDownloadableOptionEntity downloadableOption;
  final CourseLevelEntity courseLevel;
  final CourseTypeEntity courseType;
  final bool isAllowFeedback;
  final bool isAllowDiscussion;
  final CourseDiscussionEntity? discussion;
  final int acceptableScoreForAssignment;
  final int acceptableScoreForAssessment;
  final CourseDurationEntity estimatedDuration;
  final int numberOfEnrollments;
  final int totalLectures;
  final int totalQuizzes;
  final int viewCount;
  final double rating;
  final CourseMaterialOrderTypeEntity courseOrderType;
  final CourseMaterialOrderTypeEntity lectureOrderType;
  final List<CourseMaterialEntity> courseOrder;
  final Map<String, List<String>> lectureOrderByLectureId;
  final String evaluationMessage;
  final bool isXApiCourse;
  final String resourceFileUrl;
  final User? createdBy;
  final DateTime createdAt;
  final bool hasUserTakenCourse;
  final List<LectureEntity> lectures;
  final List<LearningQuizEntity> quizzes;
  final List<LearningSummaryEntity> summaries;
  final List<LearningActivityEntity> learningActivities;
  final List<LiveSessionEntity> liveSessions;
  final List<AssessmentQuestionEntity> assessmentQuestions;
  final CourseLearnerEntity? courseLearner;
  final bool isUserCanAccessCourse;

  const CourseEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.objective,
    required this.learningOutcome,
    required this.coverImage,
    required this.urlLink,
    required this.isDisplayVideo,
    required this.videoUrl,
    required this.categories,
    required this.downloadableOption,
    required this.courseLevel,
    required this.courseType,
    required this.isAllowFeedback,
    required this.isAllowDiscussion,
    required this.discussion,
    required this.acceptableScoreForAssignment,
    required this.acceptableScoreForAssessment,
    required this.estimatedDuration,
    required this.numberOfEnrollments,
    required this.totalLectures,
    required this.totalQuizzes,
    required this.viewCount,
    required this.rating,
    required this.courseOrderType,
    required this.lectureOrderType,
    required this.courseOrder,
    required this.lectureOrderByLectureId,
    required this.evaluationMessage,
    required this.isXApiCourse,
    required this.resourceFileUrl,
    required this.createdBy,
    required this.createdAt,
    required this.hasUserTakenCourse,
    required this.lectures,
    required this.quizzes,
    required this.summaries,
    required this.liveSessions,
    required this.learningActivities,
    required this.assessmentQuestions,
    required this.courseLearner,
    required this.isUserCanAccessCourse,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        objective,
        learningOutcome,
        coverImage,
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
        numberOfEnrollments,
        totalLectures,
        totalQuizzes,
        viewCount,
        rating,
        courseOrderType,
        lectureOrderType,
        courseOrder,
        lectureOrderByLectureId,
        evaluationMessage,
        isXApiCourse,
        createdBy,
        createdAt,
        hasUserTakenCourse,
        lectures,
        quizzes,
        liveSessions,
        summaries,
        learningActivities,
        assessmentQuestions,
        courseLearner,
      ];

  Course toDomainModel() {
    return Course(
      id: id,
      title: title,
      description: description,
      objective: objective,
      learningOutcome: learningOutcome,
      coverImage: coverImage.toDomainModel(),
      urlLink: urlLink,
      isDisplayVideo: isDisplayVideo,
      videoUrl: videoUrl,
      categories: categories.map((e) => e.toDomainModel()).toList(),
      downloadableOption: downloadableOption.toDomainModel(),
      courseLevel: courseLevel.toDomainModel(),
      courseType: courseType.toDomainModel(),
      isAllowFeedback: isAllowFeedback,
      isAllowDiscussion: isAllowDiscussion,
      discussion: discussion?.toDomainModel(),
      acceptableScoreForAssignment: acceptableScoreForAssignment,
      acceptableScoreForAssessment: acceptableScoreForAssessment,
      estimatedDuration: estimatedDuration.toDomainModel(),
      numberOfEnrollments: numberOfEnrollments,
      totalLectures: totalLectures,
      totalQuizzes: totalQuizzes,
      viewCount: viewCount,
      rating: rating,
      courseOrderType: courseOrderType.toDomainModel(),
      lectureOrderType: lectureOrderType.toDomainModel(),
      courseOrder: courseOrder.map((e) => e.toDomainModel()).toList(),
      lectureOrderByLectureId: lectureOrderByLectureId,
      evaluationMessage: evaluationMessage,
      isXapiCourse: isXApiCourse,
      resourceFileUrl: resourceFileUrl,
      createdBy: createdBy,
      createdAt: createdAt,
      hasUserTakenCourse: hasUserTakenCourse,
      lectures: lectures.map((e) => e.toDomainModel()).toList(),
      quizzes: quizzes.map((e) => e.toDomainModel()).toList(),
      summaries: summaries.map((e) => e.toDomainModel()).toList(),
      learningActivities:
          learningActivities.map((e) => e.toDomainModel()).toList(),
      liveSessions: liveSessions.map((e) => e.toDomainModel()).toList(),
      assessmentQuestions:
          assessmentQuestions.map((e) => e.toDomainModel()).toList(),
      courseLearner: courseLearner?.toDomainModel(),
      isUserCanAccessCourse: isUserCanAccessCourse,
    );
  }

  CourseEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? objective,
    String? learningOutcome,
    ImageUrlEntity? coverImage,
    String? urlLink,
    bool? isDisplayVideo,
    String? videoUrl,
    List<CourseCategoryEntity>? categories,
    CourseDownloadableOptionEntity? downloadableOption,
    CourseLevelEntity? courseLevel,
    CourseTypeEntity? courseType,
    bool? isAllowFeedback,
    bool? isAllowDiscussion,
    CourseDiscussionEntity? discussion,
    int? acceptableScoreForAssignment,
    int? acceptableScoreForAssessment,
    CourseDurationEntity? estimatedDuration,
    int? numberOfEnrollments,
    int? totalLectures,
    int? totalQuizzes,
    int? viewCount,
    double? rating,
    CourseMaterialOrderTypeEntity? courseOrderType,
    CourseMaterialOrderTypeEntity? lectureOrderType,
    List<CourseMaterialEntity>? courseOrder,
    Map<String, List<String>>? lectureOrderByLectureId,
    String? evaluationMessage,
    bool? isXApiCourse,
    String? resourceFileUrl,
    User? createdBy,
    DateTime? createdAt,
    bool? hasUserTakenCourse,
    List<LectureEntity>? lectures,
    List<LearningQuizEntity>? quizzes,
    List<LearningSummaryEntity>? summaries,
    List<LearningActivityEntity>? learningActivities,
    List<LiveSessionEntity>? liveSessions,
    List<AssessmentQuestionEntity>? assessmentQuestions,
    CourseLearnerEntity? courseLearner,
    bool? isUserCanAccessCourse,
  }) {
    return CourseEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      objective: objective ?? this.objective,
      learningOutcome: learningOutcome ?? this.learningOutcome,
      coverImage: coverImage ?? this.coverImage,
      urlLink: urlLink ?? this.urlLink,
      isDisplayVideo: isDisplayVideo ?? this.isDisplayVideo,
      videoUrl: videoUrl ?? this.videoUrl,
      categories: categories ?? this.categories,
      downloadableOption: downloadableOption ?? this.downloadableOption,
      courseLevel: courseLevel ?? this.courseLevel,
      courseType: courseType ?? this.courseType,
      isAllowFeedback: isAllowFeedback ?? this.isAllowFeedback,
      isAllowDiscussion: isAllowDiscussion ?? this.isAllowDiscussion,
      discussion: discussion ?? this.discussion,
      acceptableScoreForAssignment:
          acceptableScoreForAssignment ?? this.acceptableScoreForAssignment,
      acceptableScoreForAssessment:
          acceptableScoreForAssessment ?? this.acceptableScoreForAssessment,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      numberOfEnrollments: numberOfEnrollments ?? this.numberOfEnrollments,
      totalLectures: totalLectures ?? this.totalLectures,
      totalQuizzes: totalQuizzes ?? this.totalQuizzes,
      viewCount: viewCount ?? this.viewCount,
      rating: rating ?? this.rating,
      courseOrderType: courseOrderType ?? this.courseOrderType,
      lectureOrderType: lectureOrderType ?? this.lectureOrderType,
      courseOrder: courseOrder ?? this.courseOrder,
      lectureOrderByLectureId:
          lectureOrderByLectureId ?? this.lectureOrderByLectureId,
      evaluationMessage: evaluationMessage ?? this.evaluationMessage,
      isXApiCourse: isXApiCourse ?? this.isXApiCourse,
      resourceFileUrl: resourceFileUrl ?? this.resourceFileUrl,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      hasUserTakenCourse: hasUserTakenCourse ?? this.hasUserTakenCourse,
      lectures: lectures ?? this.lectures,
      quizzes: quizzes ?? this.quizzes,
      summaries: summaries ?? this.summaries,
      learningActivities: learningActivities ?? this.learningActivities,
      liveSessions: liveSessions ?? this.liveSessions,
      assessmentQuestions: assessmentQuestions ?? this.assessmentQuestions,
      courseLearner: courseLearner ?? this.courseLearner,
      isUserCanAccessCourse:
          isUserCanAccessCourse ?? this.isUserCanAccessCourse,
    );
  }
}
