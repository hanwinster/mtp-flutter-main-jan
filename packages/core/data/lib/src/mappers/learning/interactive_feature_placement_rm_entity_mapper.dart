import 'package:api/api.dart';
import 'package:database/database.dart';

extension InteractiveFeaturePlacementRMEntityMapper
    on InteractiveFeaturePlacementRM {
  InteractiveFeaturePlacementEntity toEntity() {
    switch (this) {
      case InteractiveFeaturePlacementRM.above:
        return InteractiveFeaturePlacementEntity.above;
      case InteractiveFeaturePlacementRM.below:
        return InteractiveFeaturePlacementEntity.below;
      default:
        return InteractiveFeaturePlacementEntity.unknown;
    }
  }
}
