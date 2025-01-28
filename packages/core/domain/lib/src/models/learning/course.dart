import 'package:base/base.dart';
import 'package:domain/domain.dart';

final class Course extends Equatable {
  final String id;
  final String title;
  final String description;
  final String objective;
  final String learningOutcome;
  final ImageUrl coverImage;
  final String urlLink;
  final bool isDisplayVideo;
  final String videoUrl;
  final List<CourseCategory> categories;
  final CourseDownloadableOption downloadableOption;
  final CourseLevel courseLevel;
  final CourseType courseType;
  final bool isAllowFeedback;
  final bool isAllowDiscussion;
  final CourseDiscussion? discussion;
  final int acceptableScoreForAssignment;
  final int acceptableScoreForAssessment;
  final CourseDuration estimatedDuration;
  final int numberOfEnrollments;
  final int totalLectures;
  final int totalQuizzes;
  final int viewCount;
  final double rating;
  final CourseMaterialOrderType courseOrderType;
  final CourseMaterialOrderType lectureOrderType;
  final List<CourseMaterial> courseOrder;
  final Map<String, List<String>> lectureOrderByLectureId;
  final String evaluationMessage;
  final bool isXapiCourse;
  final String resourceFileUrl;
  final User? createdBy;
  final DateTime createdAt;
  final bool hasUserTakenCourse;
  final List<Lecture> lectures;
  final List<LearningQuiz> quizzes;
  final List<LearningSummary> summaries;
  final List<LearningActivity> learningActivities;
  final List<AssessmentQuestion> assessmentQuestions;
  final List<LiveSession> liveSessions;
  final CourseLearner? courseLearner;
  final bool isUserCanAccessCourse;

  const Course({
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
    required this.isXapiCourse,
    required this.resourceFileUrl,
    required this.createdBy,
    required this.createdAt,
    required this.hasUserTakenCourse,
    required this.lectures,
    required this.quizzes,
    required this.liveSessions,
    required this.summaries,
    required this.learningActivities,
    required this.assessmentQuestions,
    required this.courseLearner,
    required this.isUserCanAccessCourse,
  });

  @override
  List<Object?> get props =>
      [
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
        isXapiCourse,
        resourceFileUrl,
        createdBy,
        createdAt,
        hasUserTakenCourse,
        lectures,
        quizzes,
        summaries,
        learningActivities,
        assessmentQuestions,
        liveSessions,
        courseLearner,
        isUserCanAccessCourse,
      ];

  bool get isCompleted {
    return courseLearner?.status == CourseLearnerStatus.completed;
  }

  CourseMaterial? _findMaterial(CourseMaterialType type, String materialId) {
    return courseOrder.firstWhereOrNull(
          (material) => material.type == type && material.id == materialId,
    );
  }

  CourseMaterial _findMaterialOrThrow(CourseMaterialType type,
      String materialId) {
    return _findMaterial(type, materialId) ??
        (throw Exception('Material not found'));
  }

  CourseMaterial? get inProgressMaterial {
    if (isXapiCourse) {
      final learner = courseLearner;
      if (learner == null) {
        return null;
      }

      final learnerCompletionStatus = learner.completionStatus;
      for (var entry in learnerCompletionStatus.entries) {
        if (!entry.value) {
          return learner.findMaterial(entry.key).toCourseMaterial();
        }
      }
    } else {
      for (var material in courseOrder) {
        if (!material.isCompleted) {
          return material;
        }
      }
    }

    return courseOrder.firstOrNull;
  }

  bool get hasAssessment => courseLearner?.hasAssessment ?? false;

  bool get hasLearnerCompletedAllAssessments {
    return courseLearner?.hasCompletedAllAssessments ?? false;
  }

  bool get isLearnerReadyForAssessment {
    return courseLearner?.isReadyForAssessment ?? false;
  }

  bool get isLearnerReadyForEvaluation {
    return courseLearner?.isReadyToEvaluate ?? false;
  }

  bool get hasLearnerCompletedCourse {
    return courseLearner?.hasCompletedCourse ?? false;
  }

  bool get isLearnerReadyToGenerateCertificate {
    return hasLearnerCompletedCourse;
  }

  List<CourseMaterial> _orderedLectureMaterials(Lecture lecture) {
    final lectureMaterials = <CourseMaterial>[];

    if (lectureOrderType == CourseMaterialOrderType.flexible) {
      final order = lectureOrderByLectureId[lecture.id] ?? [];
      for (final key in order) {
        final orderPair = key.split('_');
        final materialPrefixKey = orderPair.firstOrNull ?? '';
        final materialId = orderPair.lastOrNull ?? '';

        if (CourseMaterialType.learningActivity.prefixes
            .contains(materialPrefixKey)) {
          lectureMaterials.add(_findMaterialOrThrow(
              CourseMaterialType.learningActivity, materialId));
        } else if (CourseMaterialType.quiz.prefixes
            .contains(materialPrefixKey)) {
          lectureMaterials.add(
            _findMaterialOrThrow(CourseMaterialType.quiz, materialId),
          );
        } else if (CourseMaterialType.summary.prefixes
            .contains(materialPrefixKey)) {
          lectureMaterials.add(
            _findMaterialOrThrow(CourseMaterialType.summary, materialId),
          );
        } else if (CourseMaterialType.liveSession.prefixes
            .contains(materialPrefixKey)) {
          lectureMaterials.add(
            _findMaterialOrThrow(CourseMaterialType.liveSession, materialId),
          );
        }
      }
    } else {
      lectureMaterials.addAll(
        lecture.learningActivities
            .map(
              (lectureLearningActivity) =>
              _findMaterialOrThrow(
                  CourseMaterialType.learningActivity,
                  lectureLearningActivity.id),
        )
            .toList(),
      );
      lectureMaterials.addAll(
        lecture.quizzes
            .map((lectureQuiz) =>
            _findMaterialOrThrow(CourseMaterialType.quiz, lectureQuiz.id))
            .toList(),
      );
      lectureMaterials.addAll(
        lecture.liveSessions
            .map((lectureLiveSession) =>
            _findMaterialOrThrow(
                CourseMaterialType.liveSession, lectureLiveSession.id))
            .toList(),
      );
      lectureMaterials.addAll(
        lecture.summaries
            .map((lectureSummary) =>
            _findMaterialOrThrow(
                CourseMaterialType.summary, lectureSummary.id))
            .toList(),
      );
    }
    return lectureMaterials;
  }

  List<CourseMaterial> get orderedCourseMaterials {
    return courseOrder
        .whereNot((material) => material.type == CourseMaterialType.assessment)
        .map(
          (material) {
        if (material.type == CourseMaterialType.lecture) {
          final lecture =
          lectures.firstWhereOrNull((lecture) => lecture.id == material.id);
          if (lecture == null) {
            return material;
          }
          return material.copyWith(
            submodules: _orderedLectureMaterials(lecture),
          );
        } else {
          return material;
        }
      },
    ).toList();
  }

  List<CourseMaterial> get lectureMaterials {
    return courseOrder
        .where((material) => material.type == CourseMaterialType.lecture)
        .map((lectureMaterial) {
      final lecture = lectures
          .firstWhereOrNull((lecture) => lecture.id == lectureMaterial.id);
      if (lecture == null) {
        return lectureMaterial;
      }
      return lectureMaterial.copyWith(
        submodules: _orderedLectureMaterials(lecture),
      );
    }).toList();
  }

  List<CourseMaterial> get learningActivityMaterials {
    return courseOrder
        .where(
            (material) => material.type == CourseMaterialType.learningActivity)
        .toList();
  }

  List<CourseMaterial> get quizMaterials {
    return courseOrder
        .where((material) => material.type == CourseMaterialType.quiz)
        .toList();
  }

  List<CourseMaterial> get summaryMaterials {
    return courseOrder
        .where((material) => material.type == CourseMaterialType.summary)
        .toList();
  }

  List<CourseMaterial> get assessmentMaterials {
    return courseOrder
        .where((material) => material.type == CourseMaterialType.assessment)
        .toList();
  }

  List<CourseMaterial> get liveSessionMaterials {
    return courseOrder
        .where((material) => material.type == CourseMaterialType.liveSession)
        .toList();
  }

  CourseMaterial? get introMaterial {
    return courseOrder.firstWhereOrNull(
          (material) =>
      material.type == CourseMaterialType.intro && material.id == id,
    );
  }

  CourseMaterial? get xApiMaterial {
    return courseLearner?.xApiMaterial;
  }

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? objective,
    String? learningOutcome,
    ImageUrl? coverImage,
    String? urlLink,
    bool? isDisplayVideo,
    String? videoUrl,
    List<CourseCategory>? categories,
    CourseDownloadableOption? downloadableOption,
    CourseLevel? courseLevel,
    CourseType? courseType,
    bool? isAllowFeedback,
    bool? isAllowDiscussion,
    CourseDiscussion? discussion,
    int? acceptableScoreForAssignment,
    int? acceptableScoreForAssessment,
    CourseDuration? estimatedDuration,
    int? numberOfEnrollments,
    int? totalLectures,
    int? totalQuizzes,
    int? viewCount,
    double? rating,
    CourseMaterialOrderType? courseOrderType,
    CourseMaterialOrderType? lectureOrderType,
    List<CourseMaterial>? courseOrder,
    Map<String, List<String>>? lectureOrder,
    String? evaluationMessage,
    bool? isXapiCourse,
    String? resourceFileUrl,
    User? createdBy,
    DateTime? createdAt,
    bool? hasUserTakenCourse,
    List<Lecture>? lectures,
    List<LearningQuiz>? quizzes,
    List<LearningSummary>? summaries,
    List<LearningActivity>? learningActivities,
    List<LiveSession>? liveSessions,
    List<AssessmentQuestion>? assessmentQuestions,
    CourseLearner? courseLearner,
    bool? isUserCanAccess,
  }) {
    return Course(
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
      lectureOrderByLectureId: lectureOrder ?? lectureOrderByLectureId,
      evaluationMessage: evaluationMessage ?? this.evaluationMessage,
      isXapiCourse: isXapiCourse ?? this.isXapiCourse,
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
      isUserCanAccessCourse: isUserCanAccess ?? isUserCanAccessCourse,
    );
  }
}
