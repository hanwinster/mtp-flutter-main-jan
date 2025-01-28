import 'package:database/database.dart';
import 'package:drift_database/drift_database.dart';

extension LectureEntryEntityMapper on LectureEntry {
  LectureEntity toEntity({
    required List<LearningActivityEntity> learningActivities,
    required List<LearningSummaryEntity> summaries,
    required List<LearningQuizEntity> quizzes,
    required List<LiveSessionEntity> liveSessions,
  }) {
    return LectureEntity(
      id: id,
      title: title,
      resourceUrl: resourceUrl,
      description: description,
      resourceType: resourceType,
      videoUrl: videoUrl,
      attachedFileUrl: attachedFileUrl,
      courseId: courseId,
      media: media,
      interactiveFeatures: interactiveFeatures,
      learningActivities: learningActivities,
      summaries: summaries,
      quizzes: quizzes,
      liveSessions: liveSessions,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
