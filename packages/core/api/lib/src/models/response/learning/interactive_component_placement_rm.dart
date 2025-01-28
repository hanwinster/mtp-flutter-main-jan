import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interactive_component_placement_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum InteractiveFeaturePlacementRM {
  @JsonValue('above')
  above,
  @JsonValue('below') 
  below,
  @JsonValue('unknown')
  unknown;

  factory InteractiveFeaturePlacementRM.fromJson(String value) => decodeEnum(
    _$InteractiveFeaturePlacementRMEnumMap,
    value,
    unknownValue: InteractiveFeaturePlacementRM.unknown,
  );

  String toJson() => encodeEnum(_$InteractiveFeaturePlacementRMEnumMap, this);

  InteractiveFeaturePlacement toDomainModel() {
    switch (this) {
      case InteractiveFeaturePlacementRM.above:
        return InteractiveFeaturePlacement.above;
      case InteractiveFeaturePlacementRM.below:
        return InteractiveFeaturePlacement.below;
      default:
        return InteractiveFeaturePlacement.unknown;
    }
  }
}
