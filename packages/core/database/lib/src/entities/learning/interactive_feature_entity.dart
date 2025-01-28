import 'package:base/base.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_feature_entity.g.dart';

@JsonSerializable()
class InteractiveFeatureEntity extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "course_id")
  final String courseId;
  @JsonKey(name: "attached_to")
  final String attachedTo;
  @JsonKey(name: "attached_to_id")
  final String attachedToId;
  @JsonKey(name: "type", unknownEnumValue: InteractiveFeatureTypeEntity.unknown)
  final InteractiveFeatureTypeEntity type;
  @JsonKey(name: "position")
  final int position;
  @JsonKey(name: "placement")
  final InteractiveFeaturePlacementEntity placement;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "back_title")
  final String backTitle;
  @JsonKey(name: "back_description")
  final String backDescription;
  @JsonKey(name: "options")
  final List<InteractiveSortingAnswerOptionEntity>? options;
  @JsonKey(name: "correct_answer")
  final int correctAnswer;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "back_image")
  final String backImage;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  factory InteractiveFeatureEntity.fromJson(Map<String, dynamic> json) =>
      _$InteractiveFeatureEntityFromJson(json);

  Map<String, dynamic> toJson() => _$InteractiveFeatureEntityToJson(this);

  const InteractiveFeatureEntity({
    required this.id,
    required this.title,
    required this.courseId,
    required this.attachedTo,
    required this.attachedToId,
    required this.type,
    required this.position,
    required this.placement,
    required this.description,
    required this.backTitle,
    required this.backDescription,
    required this.options,
    required this.correctAnswer,
    required this.image,
    required this.backImage,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        courseId,
        attachedTo,
        attachedToId,
        type,
        position,
        placement,
        description,
        backTitle,
        backDescription,
        options,
        correctAnswer,
        image,
        backImage,
        createdAt,
        updatedAt,
        deletedAt,
      ];

  InteractiveFeature toDomainModel() {
    switch (type) {
      case InteractiveFeatureTypeEntity.accordion:
        return InteractiveAccordion(
          id: id,
          position: position,
          placement: placement.toDomainModel(),
          title: title ?? '',
          description: description,
          imageUrl: image,
        );
      case InteractiveFeatureTypeEntity.slider:
        return InteractiveSlider(
          id: id,
          position: position,
          placement: placement.toDomainModel(),
          title: title,
          description: description,
          imageUrl: image,
        );
      case InteractiveFeatureTypeEntity.flipCard:
        return InteractiveFlipCard(
          id: id,
          position: position,
          placement: placement.toDomainModel(),
          frontTitle: title,
          frontDescription: description,
          frontImageUrl: image,
          backImageUrl: backImage,
          backTitle: backTitle,
          backDescription: backDescription,
        );
      case InteractiveFeatureTypeEntity.imageText:
        return InteractiveImageText(
          id: id,
          position: position,
          placement: placement.toDomainModel(),
          title: title,
          description: description,
          imageUrl: image,
        );
      case InteractiveFeatureTypeEntity.process:
        return InteractiveProcess(
          id: id,
          position: position,
          placement: placement.toDomainModel(),
          title: title,
          description: description,
          imageUrl: image,
        );
      case InteractiveFeatureTypeEntity.sortingActivity:
        return InteractiveSortingActivity(
          id: id,
          position: position,
          placement: placement.toDomainModel(),
          description: description,
          options: options!.map((e) => e.toDomainModel()).toList(),
          correctAnswerKey: correctAnswer,
        );
      case InteractiveFeatureTypeEntity.unknown:
        throw Exception('Unsupported interactive feature type: $type');
    }
  }
}
