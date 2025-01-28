import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class LectureEntity extends Equatable {
  final String id;
  final String title;
  final String resourceUrl;
  final String description;
  final LectureResourceTypeEntity resourceType;
  final String videoUrl;
  final String attachedFileUrl;
  final String courseId;
  final MediaEntity? media;
  final List<InteractiveFeatureEntity> interactiveFeatures;
  final List<LearningActivityEntity> learningActivities;
  final List<LearningSummaryEntity> summaries;
  final List<LearningQuizEntity> quizzes;
  final List<LiveSessionEntity> liveSessions;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const LectureEntity({
    required this.id,
    required this.title,
    required this.resourceUrl,
    required this.description,
    required this.resourceType,
    required this.videoUrl,
    required this.attachedFileUrl,
    required this.courseId,
    required this.interactiveFeatures,
    required this.learningActivities,
    required this.liveSessions,
    required this.summaries,
    required this.quizzes,
    required this.media,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        resourceUrl,
        description,
        resourceType,
        videoUrl,
        attachedFileUrl,
        courseId,
        media,
        interactiveFeatures,
        learningActivities,
        liveSessions,
        summaries,
        quizzes,
        createdAt,
        updatedAt,
      ];

  Lecture toDomainModel() {
    return Lecture(
      id: id,
      title: title,
      resourceUrl: resourceUrl,
      description: description,
      resourceType: resourceType.toDomainModel(),
      videoUrl: videoUrl,
      attachedFileUrl: attachedFileUrl,
      courseId: courseId,
      learningActivities: const [],
      quizzes: const [],
      summaries: const [],
      liveSessions: const [],
      interactiveFeatures:
          interactiveFeatures.map((e) => e.toDomainModel()).toList(),
      media: media?.toDomainModel(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  LectureEntity copyWith({
    String? id,
    String? title,
    String? resourceUrl,
    String? description,
    LectureResourceTypeEntity? resourceType,
    String? videoUrl,
    String? attachedFileUrl,
    String? courseId,
    MediaEntity? media,
    List<InteractiveFeatureEntity>? interactiveContents,
    List<LearningActivityEntity>? learningActivities,
    List<LiveSessionEntity>? liveSessions,
    List<LearningSummaryEntity>? summaries,
    List<LearningQuizEntity>? quizzes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LectureEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      resourceUrl: resourceUrl ?? this.resourceUrl,
      description: description ?? this.description,
      resourceType: resourceType ?? this.resourceType,
      videoUrl: videoUrl ?? this.videoUrl,
      attachedFileUrl: attachedFileUrl ?? this.attachedFileUrl,
      courseId: courseId ?? this.courseId,
      media: media ?? this.media,
      interactiveFeatures: interactiveContents ?? interactiveFeatures,
      learningActivities: learningActivities ?? this.learningActivities,
      liveSessions: liveSessions ?? this.liveSessions,
      summaries: summaries ?? this.summaries,
      quizzes: quizzes ?? this.quizzes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
