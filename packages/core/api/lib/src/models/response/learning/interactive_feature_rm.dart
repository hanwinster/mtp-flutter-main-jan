import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_feature_rm.g.dart';

@JsonSerializable()
class InteractiveFeatureRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "course_id")
  final int? courseId;
  @JsonKey(name: "attached_to")
  final String? attachedTo;
  @JsonKey(name: "attached_to_id")
  final int? attachedToId;
  @JsonKey(name: "type")
  final InteractiveFeatureTypeRM? type;
  @JsonKey(name: "position")
  final int? position;
  @JsonKey(
      name: "order", unknownEnumValue: InteractiveFeaturePlacementRM.unknown)
  final InteractiveFeaturePlacementRM? placement;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "back_title")
  final String? backTitle;
  @JsonKey(name: "back_description")
  final String? backDescription;
  @JsonKey(name: "answers")
  final List<InteractiveSortingAnswerOptionRM>? answers;
  @JsonKey(name: "right_answer")
  final int? rightAnswer;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "back_image")
  final String? backImage;

  const InteractiveFeatureRM({
    this.id,
    this.title,
    this.courseId,
    this.attachedTo,
    this.attachedToId,
    this.type,
    this.position,
    this.placement,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.backTitle,
    this.backDescription,
    this.answers,
    this.rightAnswer,
    this.image,
    this.backImage,
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
        userId,
        createdAt,
        updatedAt,
        description,
        backTitle,
        backDescription,
        answers,
        rightAnswer,
        image,
        backImage,
      ];

  factory InteractiveFeatureRM.fromJson(Map<String, dynamic> json) {
    return _$InteractiveFeatureRMFromJson(json);
  }

  InteractiveFeature toDomainModel() {
    switch (type) {
      case InteractiveFeatureTypeRM.accordion:
        return InteractiveAccordion(
          id: id?.toString() ?? '',
          position: position ?? 0,
          placement:
              placement?.toDomainModel() ?? InteractiveFeaturePlacement.unknown,
          title: title ?? '',
          description: description ?? '',
          imageUrl: image ?? '',
        );
      case InteractiveFeatureTypeRM.slider:
        return InteractiveSlider(
          id: id?.toString() ?? '',
          position: position ?? 0,
          placement:
              placement?.toDomainModel() ?? InteractiveFeaturePlacement.unknown,
          title: title ?? '',
          description: description ?? '',
          imageUrl: image ?? '',
        );
      case InteractiveFeatureTypeRM.flipCard:
        return InteractiveFlipCard(
          id: id?.toString() ?? '',
          position: position ?? 0,
          placement:
              placement?.toDomainModel() ?? InteractiveFeaturePlacement.unknown,
          frontDescription: title ?? '',
          frontTitle: description ?? '',
          frontImageUrl: image ?? '',
          backImageUrl: backImage ?? '',
          backTitle: backTitle ?? '',
          backDescription: backDescription ?? '',
        );
      default:
        throw UnimplementedError('Unknown interactive feature type: $type');
    }
  }
}
