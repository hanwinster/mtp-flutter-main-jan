import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_duration_unit_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseDurationUnitEntity {
  @JsonValue('second(s)')
  second,
  @JsonValue('minute(s)')
  minute,
  @JsonValue('hour(s)')
  hour,
  @JsonValue('day(s)')
  day,
  @JsonValue('week(s)')
  week,
  @JsonValue('month(s)')
  month,
  @JsonValue('year(s)')
  year,
  @JsonValue('unknown')
  unknown;

  factory CourseDurationUnitEntity.fromJson(String value) => decodeEnum(
    _$CourseDurationUnitEntityEnumMap,
    value,
    unknownValue: CourseDurationUnitEntity.unknown,
  );

  String toJson() => encodeEnum(_$CourseDurationUnitEntityEnumMap, this);

  CourseDurationUnit toDomainModel() {
    switch (this) {
      case CourseDurationUnitEntity.second:
        return CourseDurationUnit.second;
      case CourseDurationUnitEntity.minute:
        return CourseDurationUnit.minute;
      case CourseDurationUnitEntity.hour:
        return CourseDurationUnit.hour;
      case CourseDurationUnitEntity.day:
        return CourseDurationUnit.day;
      case CourseDurationUnitEntity.week:
        return CourseDurationUnit.week;
      case CourseDurationUnitEntity.month:
        return CourseDurationUnit.month;
      case CourseDurationUnitEntity.year:
        return CourseDurationUnit.year;
      default:
        return CourseDurationUnit.unknown;
    }
  }
}