import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension CourseEntityEntryMapper on CourseEntity {
  CourseEntry toEntry() {
    return CourseEntry(
      id: id,
      title: title,
      description: description,
      objective: objective,
      learningOutcome: learningOutcome,
      coverImage: coverImage,
      urlLink: urlLink,
      isDisplayVideo: isDisplayVideo,
      videoUrl: videoUrl,
      categories: categories,
      downloadableOption: downloadableOption,
      courseLevel: courseLevel,
      courseType: courseType,
      isAllowFeedback: isAllowFeedback,
      isAllowDiscussion: isAllowDiscussion,
      discussion: discussion,
      acceptableScoreForAssignment: acceptableScoreForAssignment,
      acceptableScoreForAssessment: acceptableScoreForAssessment,
      estimatedDuration: estimatedDuration,
      numberOfEnrollments: numberOfEnrollments,
      totalLectures: totalLectures,
      totalQuizzes: totalQuizzes,
      viewCount: viewCount,
      rating: rating,
      courseOrderType: courseOrderType,
      lectureOrderType: lectureOrderType,
      courseOrder: courseOrder,
      lectureOrderByLectureId: lectureOrderByLectureId,
      evaluationMessage: evaluationMessage,
      isXApiCourse: isXApiCourse,
      resourceFileUrl: resourceFileUrl,
      hasUserTakenCourse: hasUserTakenCourse,
      isUserCanAccessCourse: isUserCanAccessCourse,
      createdAt: createdAt,
    );
  }
}
