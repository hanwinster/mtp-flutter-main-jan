import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_feature_placement_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum InteractiveFeaturePlacementEntity {
  @JsonValue('above')
  above,
  @JsonValue('below') 
  below,
  @JsonValue('unknown')
  unknown;

  factory InteractiveFeaturePlacementEntity.fromJson(String value) => decodeEnum(
    _$InteractiveFeaturePlacementEntityEnumMap,
    value,
    unknownValue: InteractiveFeaturePlacementEntity.unknown,
  );

  String toJson() => encodeEnum(_$InteractiveFeaturePlacementEntityEnumMap, this);

  InteractiveFeaturePlacement toDomainModel() {
    switch (this) {
      case InteractiveFeaturePlacementEntity.above:
        return InteractiveFeaturePlacement.above;
      case InteractiveFeaturePlacementEntity.below:
        return InteractiveFeaturePlacement.below;
      default:
        return InteractiveFeaturePlacement.unknown;
    }
  }
}
