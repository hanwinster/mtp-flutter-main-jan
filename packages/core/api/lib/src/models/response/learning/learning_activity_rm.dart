import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_activity_rm.g.dart';

@JsonSerializable(createToJson: false)
class LearningActivityRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "lecture_id")
  final int? lectureId;
  @JsonKey(name: 'learning_activity_media')
  final List<MediaRM>? mediaList;
  @JsonKey(name: 'interactive_features')
  final List<InteractiveFeatureRM>? interactiveFeatures;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  const LearningActivityRM({
    this.id,
    this.title,
    this.description,
    this.courseId,
    this.userId,
    this.lectureId,
    this.mediaList,
    this.interactiveFeatures,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        courseId,
        userId,
        lectureId,
        createdAt,
        updatedAt,
      ];

  factory LearningActivityRM.fromJson(Map<String, dynamic> json) =>
      _$LearningActivityRMFromJson(json);

  LearningActivity toDomainModel() {
    // final upperInteractiveComponents = interactiveComponentsAboveMedia ?? [];
    // final lowerInteractiveComponents = interactiveComponentsBelowMedia ?? [];
    //
    // final List<InteractiveAccordionRM> accordions = [];
    // final List<InteractiveFlipCardRM> flipCards = [];
    // final List<InteractiveSliderRM> sliders = [];
    //
    // for (var element in upperInteractiveComponents) {
    //   accordions.addAll(element.accordions ?? []);
    //   flipCards.addAll(element.flipcards ?? []);
    //   sliders.addAll(element.sliders ?? []);
    // }
    // for (var element in lowerInteractiveComponents) {
    //   accordions.addAll(element.accordions ?? []);
    //   flipCards.addAll(element.flipcards ?? []);
    //   sliders.addAll(element.sliders ?? []);
    // }
    //
    // final interactiveContents = [
    //   ...accordions.map((e) => e.toDomainModel()),
    //   ...flipCards.map((e) => e.toDomainModel()),
    //   ...sliders.map((e) => e.toDomainModel())
    // ];

    return LearningActivity(
      id: id?.toString() ?? (throw Exception('id must not be null')),
      title: title ?? '',
      description: description ?? '',
      media: _parseLearningActivityMedia(),
      lectureId: lectureId?.toString() ?? '',
      interactiveFeatures: interactiveFeatures?.map((e) => e.toDomainModel()).toList() ?? [],
    );
  }

  Media? _parseLearningActivityMedia() {
    return mediaList
        ?.firstWhereOrNull(
          (element) => element.modelId == id,
        )
        ?.toDomainModel();
  }

  LearningActivityRM copyWith({
    int? id,
    String? title,
    String? description,
    int? courseId,
    int? userId,
    int? lectureId,
    List<MediaRM>? mediaList,
    List<InteractiveFeatureRM>? interactiveFeatures,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LearningActivityRM(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      courseId: courseId ?? this.courseId,
      userId: userId ?? this.userId,
      lectureId: lectureId ?? this.lectureId,
      mediaList: mediaList ?? this.mediaList,
      interactiveFeatures: interactiveFeatures ?? this.interactiveFeatures,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
