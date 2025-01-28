// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_duration_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDurationEntity _$CourseDurationEntityFromJson(
        Map<String, dynamic> json) =>
    CourseDurationEntity(
      duration: (json['duration'] as num).toInt(),
      unit: CourseDurationUnitEntity.fromJson(json['unit'] as String),
    );

Map<String, dynamic> _$CourseDurationEntityToJson(
        CourseDurationEntity instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'unit': instance.unit.toJson(),
    };
