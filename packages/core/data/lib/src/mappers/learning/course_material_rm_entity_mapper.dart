import 'package:api/api.dart';
import 'package:database/database.dart';
import 'course_material_type_rm_entity_mapper.dart';

extension CourseMaterialRMEntityMapper on CourseMaterialRM {
  CourseMaterialEntity toEntity() {
    return CourseMaterialEntity(
      id: id?.toString() ?? '',
      title: title ?? '',
      isCompleted: isCompleted == 1,
      key: key ?? '',
      type: type?.toEntity() ?? CourseMaterialTypeEntity.unknown,
    );
  }
}
