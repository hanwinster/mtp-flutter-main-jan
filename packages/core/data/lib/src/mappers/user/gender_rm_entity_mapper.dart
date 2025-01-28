import 'package:api/api.dart';
import 'package:database/database.dart';

extension GenderRMEntityMapper on GenderRM {
  GenderEntity toEntity() {
    switch (this) {
      case GenderRM.male:
        return GenderEntity.male;
      case GenderRM.female:
        return GenderEntity.female;
      case GenderRM.other:
        return GenderEntity.other;
      case GenderRM.unknown:
        return GenderEntity.unknown;
    }
  }
}