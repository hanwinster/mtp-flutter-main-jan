import 'package:api/api.dart';
import 'package:database/database.dart';

extension CourseMaterialOrderTypeRMEntityMapper on CourseMaterialOrderTypeRM {
  CourseMaterialOrderTypeEntity toEntity() {
    switch (this) {
      case CourseMaterialOrderTypeRM.fixed:
        return CourseMaterialOrderTypeEntity.fixed;
      case CourseMaterialOrderTypeRM.flexible:
        return CourseMaterialOrderTypeEntity.flexible;
      default:
        return CourseMaterialOrderTypeEntity.unknown;
    }
  }
}
