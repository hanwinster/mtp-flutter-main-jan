import 'package:api/api.dart';
import 'package:api/src/json/converters/converters.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecture_rm.g.dart';

@JsonSerializable(createToJson: false)
@DateTimeStringConverter()
final class LectureRM extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'lecture_title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'resource_type', unknownEnumValue: LectureResourceTypeRM.none)
  final LectureResourceTypeRM? resourceType;
  @JsonKey(name: 'video_link')
  final String? videoLink;
  @JsonKey(name: 'attached_file')
  final String? attachedFile;
  @JsonKey(name: 'resource_link')
  final String? resourceLink;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'course_id')
  final int? courseId;
  @JsonKey(name: 'quizzes')
  final List<LearningQuizRM>? quizzes;
  @JsonKey(name: 'summaries')
  final List<LearningSummaryRM>? summaries;
  @JsonKey(name: 'learning_activities')
  final List<LearningActivityRM>? learningActivities;
  @JsonKey(name: 'live_sessions')
  final List<LiveSessionRM>? liveSessions;
  @JsonKey(name: 'interactive_features')
  final List<InteractiveFeatureRM>? interactiveFeatures;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const LectureRM({
    this.id,
    this.title,
    this.description,
    this.resourceType,
    this.videoLink,
    this.resourceLink,
    this.attachedFile,
    this.userId,
    this.courseId,
    this.quizzes,
    this.summaries,
    this.liveSessions,
    this.learningActivities,
    this.interactiveFeatures,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceType,
        videoLink,
        resourceLink,
        userId,
        courseId,
        summaries,
        liveSessions,
        interactiveFeatures,
        createdAt,
        updatedAt,
      ];

  factory LectureRM.fromJson(Map<String, dynamic> json) =>
      _$LectureRMFromJson(json);

  Lecture toDomainModel() {
    return Lecture(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      title: title ?? '',
      description: description ?? '',
      resourceType: resourceType?.toDomainModel() ?? LectureResourceType.none,
      videoUrl: videoLink ?? '',
      attachedFileUrl: attachedFile ?? '',
      resourceUrl: resourceLink ?? '',
      courseId: courseId?.toString() ??
          (throw Exception('courseId must not be null')),
      quizzes: quizzes
              ?.where((e) => e.lectureId == id)
              .map((e) => e.toDomainModel())
              .toList() ??
          [],
      summaries: summaries?.map((e) => e.toDomainModel()).toList() ?? [],
      learningActivities:
          learningActivities?.map((e) => e.toDomainModel()).toList() ?? [],
      interactiveFeatures:
          interactiveFeatures?.map((e) => e.toDomainModel()).toList() ?? [],
      liveSessions: liveSessions?.map((e) => e.toDomainModel()).toList() ?? [],
      media: null,
      // replaced by attachedFile
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  LectureRM copyWith({
    int? id,
    String? title,
    String? description,
    LectureResourceTypeRM? resourceType,
    String? videoLink,
    String? resourceLink,
    int? userId,
    int? courseId,
    List<LearningQuizRM>? quizzes,
    List<LearningSummaryRM>? summaries,
    List<LearningActivityRM>? learningActivities,
    List<InteractiveFeatureRM>? interactiveFeatures,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LectureRM(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceType: resourceType ?? this.resourceType,
      videoLink: videoLink ?? this.videoLink,
      resourceLink: resourceLink ?? this.resourceLink,
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      quizzes: quizzes ?? this.quizzes,
      summaries: summaries ?? this.summaries,
      learningActivities: learningActivities ?? this.learningActivities,
      interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
