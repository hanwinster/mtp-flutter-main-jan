import 'package:base/base.dart';
import 'package:domain/domain.dart';

class Lecture extends Equatable {
  final String id;
  final String title;
  final String resourceUrl;
  final String description;
  final LectureResourceType resourceType;
  final String videoUrl;
  final String attachedFileUrl;
  final String courseId;
  final List<LearningQuiz> quizzes;
  final List<LearningSummary> summaries;
  final List<LearningActivity> learningActivities;
  final List<LiveSession> liveSessions;
  final List<InteractiveFeature> interactiveFeatures;
  final Media? media;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Lecture({
    required this.id,
    required this.title,
    required this.resourceUrl,
    required this.description,
    required this.resourceType,
    required this.videoUrl,
    required this.attachedFileUrl,
    required this.courseId,
    required this.quizzes,
    required this.summaries,
    required this.learningActivities,
    required this.liveSessions,
    required this.interactiveFeatures,
    required this.media,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get hasSubmodules =>
      quizzes.isNotEmpty ||
      summaries.isNotEmpty ||
      learningActivities.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        title,
        resourceUrl,
        description,
        resourceType,
        attachedFileUrl,
        videoUrl,
        courseId,
        quizzes,
        summaries,
        liveSessions,
        learningActivities,
        interactiveFeatures,
        createdAt,
        updatedAt,
      ];

  Lecture copyWith({
    String? id,
    String? title,
    String? resourceUrl,
    String? description,
    LectureResourceType? resourceType,
    String? videoUrl,
    String? attachedFileUrl,
    String? courseId,
    List<LearningQuiz>? quizzes,
    List<LearningSummary>? summaries,
    List<LearningActivity>? learningActivities,
    List<LiveSession>? liveSessions,
    List<InteractiveFeature>? interactiveFeatures,
    Media? media,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Lecture(
      id: id ?? this.id,
      title: title ?? this.title,
      resourceUrl: resourceUrl ?? this.resourceUrl,
      description: description ?? this.description,
      resourceType: resourceType ?? this.resourceType,
      videoUrl: videoUrl ?? this.videoUrl,
      attachedFileUrl: attachedFileUrl ?? this.attachedFileUrl,
      courseId: courseId ?? this.courseId,
      quizzes: quizzes ?? this.quizzes,
      summaries: summaries ?? this.summaries,
      learningActivities: learningActivities ?? this.learningActivities,
      liveSessions: liveSessions ?? this.liveSessions,
      interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
      media: media ?? this.media,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
