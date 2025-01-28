import 'package:api/api.dart';
import 'package:database/database.dart';

extension InteractiveFeatureTypeRMEntityMapper
    on InteractiveFeatureTypeRM {
  InteractiveFeatureTypeEntity toEntity() {
    switch (this) {
      case InteractiveFeatureTypeRM.accordion:
        return InteractiveFeatureTypeEntity.accordion;
      case InteractiveFeatureTypeRM.flipCard:
        return InteractiveFeatureTypeEntity.flipCard;
      case InteractiveFeatureTypeRM.slider:
        return InteractiveFeatureTypeEntity.slider;
      case InteractiveFeatureTypeRM.sortingActivity:
        return InteractiveFeatureTypeEntity.sortingActivity;
      case InteractiveFeatureTypeRM.imageText:
        return InteractiveFeatureTypeEntity.imageText;
      case InteractiveFeatureTypeRM.process:
        return InteractiveFeatureTypeEntity.process;
      case InteractiveFeatureTypeRM.unknown:
        return InteractiveFeatureTypeEntity.unknown;
    }
  }
}
