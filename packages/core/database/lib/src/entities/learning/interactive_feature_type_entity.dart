import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_feature_type_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum InteractiveFeatureTypeEntity {
  @JsonValue('accordion')
  accordion,
  @JsonValue('flipcard')
  flipCard,
  @JsonValue('slider')
  slider,
  @JsonValue('process')
  process,
  @JsonValue('sorting_activity')
  sortingActivity,
  @JsonValue('image_text')
  imageText,
  @JsonValue('unknown')
  unknown;

  factory InteractiveFeatureTypeEntity.fromJson(String value) => decodeEnum(
    _$InteractiveFeatureTypeEntityEnumMap,
    value,
    unknownValue: InteractiveFeatureTypeEntity.unknown,
  );

  String toJson() => encodeEnum(_$InteractiveFeatureTypeEntityEnumMap, this);

  InteractiveFeatureType toDomainModel() {
    switch (this) {
      case InteractiveFeatureTypeEntity.accordion:
        return InteractiveFeatureType.accordion;
      case InteractiveFeatureTypeEntity.flipCard:
        return InteractiveFeatureType.flipCard;
      case InteractiveFeatureTypeEntity.slider:
        return InteractiveFeatureType.slider;
      default:
        return InteractiveFeatureType.unknown;
    }
  }
}
