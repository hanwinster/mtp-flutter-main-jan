import 'package:api/api.dart';
import 'package:data/src/mappers/learning/course_material_rm_entity_mapper.dart';
import 'package:database/database.dart';
import '../mappers.dart';

extension CourseRMEntityMapper on CourseRM {
  CourseEntity toEntity() {
    return CourseEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      title: title ?? '',
      description: description ?? '',
      objective: objective ?? '',
      learningOutcome: learningOutcome ?? '',
      coverImage: coverImageUrl?.toEntity() ?? ImageUrlEntity.empty(),
      urlLink: urlLink ?? '',
      isDisplayVideo: isDisplayVideo == 1,
      videoUrl: videoUrl ?? '',
      categories: categories?.map((e) => e.toEntity()).toList() ?? [],
      downloadableOption: downloadableOption?.toEntity() ??
          CourseDownloadableOptionEntity.unknown,
      courseLevel:
          courseLevel?.toEntity() ?? (throw ('courseLevel must not be null')),
      courseType:
          courseType?.toEntity() ?? (throw ('courseType must not be null')),
      isAllowFeedback: isAllowFeedback == 1,
      isAllowDiscussion: isAllowDiscussion == 1,
      discussion: discussion?.toEntity(),
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
          courseOrderType?.toEntity() ?? CourseMaterialOrderTypeEntity.unknown,
      lectureOrderType:
          lectureOrderType?.toEntity() ?? CourseMaterialOrderTypeEntity.unknown,
      courseOrder: courseOrder?.map((e) => e.toEntity()).toList() ?? [],
      lectureOrderByLectureId: _mapLectureOrder(),
      courseLearner: courseLearner?.toEntity() ?? learner?.toEntity(),
      isXApiCourse: isXapiCourse == 1,
      resourceFileUrl: resourceFileUrl ?? '',
      createdBy: createdBy?.toDomainModel(),
      createdAt: createdAt ?? DateTime.now(),
      hasUserTakenCourse: hasUserTakenCourse ?? false,
      lectures: lectures
              ?.map(
                (e) => e.toEntity().copyWith(
                      quizzes: quizzes
                              ?.where((s) => s.lectureId == e.id)
                              .map((e) => e.toEntity())
                              .toList() ??
                          [],
                      learningActivities: learningActivities
                              ?.where((s) => s.lectureId == e.id)
                              .map((e) => e.toEntity())
                              .toList() ??
                          [],
                      summaries: summaries
                              ?.where((s) => s.lectureId == e.id)
                              .map((e) => e.toEntity())
                              .toList() ??
                          [],
                      liveSessions: liveSessions
                              ?.where((s) => s.lectureId == e.id)
                              .map((e) => e.toEntity())
                              .toList() ??
                          [],
                    ),
              )
              .toList() ??
          [],
      quizzes: quizzes
              ?.where((e) => e.lectureId == null)
              .map((e) => e.toEntity())
              .toList() ??
          [],
      summaries: summaries
              ?.where((e) => e.lectureId == null)
              .map((e) => e.toEntity())
              .toList() ??
          [],
      learningActivities: learningActivities
              ?.where((e) => e.lectureId == null)
              .map((e) => e.toEntity())
              .toList() ??
          [],
      liveSessions: liveSessions
              ?.where((e) => e.lectureId == null)
              .map((e) => e.toEntity())
              .toList() ??
          [],
      assessmentQuestions:
          assessmentQuestions?.map((e) => e.toEntity()).toList() ?? [],
      isUserCanAccessCourse: isUserCanAccess ?? false,
    );
  }

  CourseDurationEntity _mapDuration() {
    return CourseDurationEntity(
      duration: estimatedDuration ?? 0,
      unit:
          estimatedDurationUnit?.toEntity() ?? CourseDurationUnitEntity.unknown,
    );
  }

  Map<String, List<String>> _mapLectureOrder() {
    if (lectureOrder == null) {
      return {};
    }

    final result = <String, List<String>>{};
    for (final item in lectureOrder!) {
      if (item is Map<String, dynamic>) {
        final key = item.keys.first;
        final value = item.values.first;
        if (value is List) {
          result[key] = value.map((e) => e.toString()).toList();
        }
      }
    }
    return result;
  }
}
