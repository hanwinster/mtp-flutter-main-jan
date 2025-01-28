import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_duration_unit_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum CourseDurationUnitRM {
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

  factory CourseDurationUnitRM.fromJson(String value) => decodeEnum(
    _$CourseDurationUnitRMEnumMap,
    value,
    unknownValue: CourseDurationUnitRM.unknown,
  );

  String toJson() => encodeEnum(_$CourseDurationUnitRMEnumMap, this);

  CourseDurationUnit toDomainModel() {
    switch (this) {
      case CourseDurationUnitRM.second:
        return CourseDurationUnit.second;
      case CourseDurationUnitRM.minute:
        return CourseDurationUnit.minute;
      case CourseDurationUnitRM.hour:
        return CourseDurationUnit.hour;
      case CourseDurationUnitRM.day:
        return CourseDurationUnit.day;
      case CourseDurationUnitRM.week:
        return CourseDurationUnit.week;
      case CourseDurationUnitRM.month:
        return CourseDurationUnit.month;
      case CourseDurationUnitRM.year:
        return CourseDurationUnit.year;
      default:
        return CourseDurationUnit.unknown;
    }
  }
}