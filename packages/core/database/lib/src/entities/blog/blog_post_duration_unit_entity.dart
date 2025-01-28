import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_duration_unit_entity.g.dart';

@JsonEnum(
  alwaysCreate: true,
)

enum BlogPostDurationUnitEntity {
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

  factory BlogPostDurationUnitEntity.fromJson(String value) => decodeEnum(
        _$BlogPostDurationUnitEntityEnumMap,
        value,
        unknownValue: BlogPostDurationUnitEntity.unknown,
      );

  String toJson() => encodeEnum(_$BlogPostDurationUnitEntityEnumMap, this);

  BlogPostDurationUnit toDomainModel() {
    switch (this) {
      case BlogPostDurationUnitEntity.second:
        return BlogPostDurationUnit.second;
      case BlogPostDurationUnitEntity.minute:
        return BlogPostDurationUnit.minute;
      case BlogPostDurationUnitEntity.hour:
        return BlogPostDurationUnit.hour;
      case BlogPostDurationUnitEntity.day:
        return BlogPostDurationUnit.day;
      case BlogPostDurationUnitEntity.week:
        return BlogPostDurationUnit.week;
      case BlogPostDurationUnitEntity.month:
        return BlogPostDurationUnit.month;
      case BlogPostDurationUnitEntity.year:
        return BlogPostDurationUnit.year;
      default:
        return BlogPostDurationUnit.unknown;
    }
  }
}