import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_feature_type_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum InteractiveFeatureTypeRM {
  @JsonValue('accordion')
  accordion,
  @JsonValue('flipcard')
  flipCard,
  @JsonValue('slider')
  slider,
  @JsonValue('sorting_activity')
  sortingActivity,
  @JsonValue('image_text')
  imageText,
  @JsonValue('process')
  process,
  @JsonValue('unknown')
  unknown;

  factory InteractiveFeatureTypeRM.fromJson(String value) => decodeEnum(
    _$InteractiveFeatureTypeRMEnumMap,
    value,
    unknownValue: InteractiveFeatureTypeRM.unknown,
  );

  String toJson() => encodeEnum(_$InteractiveFeatureTypeRMEnumMap, this);

  InteractiveFeatureType toDomainModel() {
    switch (this) {
      case InteractiveFeatureTypeRM.accordion:
        return InteractiveFeatureType.accordion;
      case InteractiveFeatureTypeRM.flipCard:
        return InteractiveFeatureType.flipCard;
      case InteractiveFeatureTypeRM.slider:
        return InteractiveFeatureType.slider;
      case InteractiveFeatureTypeRM.sortingActivity:
        return InteractiveFeatureType.sortingActivity;
      case InteractiveFeatureTypeRM.imageText:
        return InteractiveFeatureType.imageText;
      case InteractiveFeatureTypeRM.process:
        return InteractiveFeatureType.process;
      default:
        return InteractiveFeatureType.unknown;
    }
  }
}
