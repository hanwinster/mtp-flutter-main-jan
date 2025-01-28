import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_material_order_type_entity.g.dart';

@JsonEnum(alwaysCreate: true)
enum CourseMaterialOrderTypeEntity {
  // remark: the order types are default and flexible
  // but the default is a reserved word in dart
  // so we use fixed instead of default
  @JsonValue('default')
  fixed,
  @JsonValue('flexible')
  flexible,
  @JsonValue('unknown')
  unknown;

  factory CourseMaterialOrderTypeEntity.fromJson(String value) => decodeEnum(
    _$CourseMaterialOrderTypeEntityEnumMap,
    value,
    unknownValue: CourseMaterialOrderTypeEntity.unknown,
  );

  String toJson() => encodeEnum(_$CourseMaterialOrderTypeEntityEnumMap, this);

  CourseMaterialOrderType toDomainModel() {
    switch (this) {
      case CourseMaterialOrderTypeEntity.fixed:
        return CourseMaterialOrderType.fixed;
      case CourseMaterialOrderTypeEntity.flexible:
        return CourseMaterialOrderType.flexible;
      default:
        return CourseMaterialOrderType.unknown;
    }
  }
}
