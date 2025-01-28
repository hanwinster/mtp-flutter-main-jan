import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_duration_unit_rm.g.dart';

@JsonEnum(
  alwaysCreate: true,
)
enum BlogPostDurationUnitRM {
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

  factory BlogPostDurationUnitRM.fromJson(String value) => decodeEnum(
    _$BlogPostDurationUnitRMEnumMap,
    value,
    unknownValue: BlogPostDurationUnitRM.unknown,
  );

  String toJson() => encodeEnum(_$BlogPostDurationUnitRMEnumMap, this);

  BlogPostDurationUnit toDomainModel() {
    switch (this) {
      case BlogPostDurationUnitRM.second:
        return BlogPostDurationUnit.second;
      case BlogPostDurationUnitRM.minute:
        return BlogPostDurationUnit.minute;
      case BlogPostDurationUnitRM.hour:
        return BlogPostDurationUnit.hour;
      case BlogPostDurationUnitRM.day:
        return BlogPostDurationUnit.day;
      case BlogPostDurationUnitRM.week:
        return BlogPostDurationUnit.week;
      case BlogPostDurationUnitRM.month:
        return BlogPostDurationUnit.month;
      case BlogPostDurationUnitRM.year:
        return BlogPostDurationUnit.year;
      default:
        return BlogPostDurationUnit.unknown;
    }
  }
}