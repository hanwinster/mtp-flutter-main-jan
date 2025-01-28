import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_duration_unit_entity.dart';

part 'course_duration_entity.g.dart';

@JsonSerializable()
class CourseDurationEntity extends Equatable {
  @JsonKey(name: 'duration')
  final int duration;
  @JsonKey(name: 'unit')
  final CourseDurationUnitEntity unit;

  const CourseDurationEntity({
    required this.duration,
    required this.unit,
  });

  @override
  List<Object> get props => [duration, unit];

  factory CourseDurationEntity.fromJson(Map<String, dynamic> json) => _$CourseDurationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDurationEntityToJson(this);

  CourseDuration toDomainModel() {
    return CourseDuration(
      duration: duration,
      unit: unit.toDomainModel(),
    );
  }
}