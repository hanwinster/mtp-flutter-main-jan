import 'package:api/api.dart';
import 'package:database/database.dart';
import '../mappers.dart';

extension LectureRMEntityMapper on LectureRM {
  LectureEntity toEntity() {
    return LectureEntity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      title: title ?? '',
      description: description ?? '',
      resourceType: resourceType?.toEntity() ?? LectureResourceTypeEntity.none,
      videoUrl: videoLink ?? '',
      attachedFileUrl: attachedFile ?? '',
      resourceUrl: resourceLink ?? '',
      courseId: courseId?.toString() ??
          (throw Exception('courseId must not be null')),
      quizzes: quizzes?.map((e) => e.toEntity()).toList() ?? [],
      summaries: summaries?.map((e) => e.toEntity()).toList() ?? [],
      liveSessions: liveSessions?.map((e) => e.toEntity()).toList() ?? [],
      learningActivities:
          learningActivities?.map((e) => e.toEntity()).toList() ?? [],
        interactiveFeatures: interactiveFeatures?.map((e) => e.toEntity()).toList() ?? [],
      media: null, // replaced by attachedFile
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
