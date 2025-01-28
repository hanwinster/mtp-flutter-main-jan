import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_material_order_type_rm.g.dart';

@JsonEnum(alwaysCreate: true)
enum CourseMaterialOrderTypeRM {
  // remark: the order types are default and flexible
  // but the default is a reserved word in dart
  // so we use fixed instead of default
  @JsonValue('default')
  fixed,
  @JsonValue('flexible')
  flexible,
  @JsonValue('unknown')
  unknown;

  factory CourseMaterialOrderTypeRM.fromJson(String value) => decodeEnum(
    _$CourseMaterialOrderTypeRMEnumMap,
    value,
    unknownValue: CourseMaterialOrderTypeRM.unknown,
  );

  String toJson() => encodeEnum(_$CourseMaterialOrderTypeRMEnumMap, this);

  CourseMaterialOrderType toDomainModel() {
    switch (this) {
      case CourseMaterialOrderTypeRM.fixed:
        return CourseMaterialOrderType.fixed;
      case CourseMaterialOrderTypeRM.flexible:
        return CourseMaterialOrderType.flexible;
      default:
        return CourseMaterialOrderType.unknown;
    }
  }
}