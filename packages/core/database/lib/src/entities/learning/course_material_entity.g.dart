// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_material_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseMaterialEntity _$CourseMaterialEntityFromJson(
        Map<String, dynamic> json) =>
    CourseMaterialEntity(
      key: json['key'] as String,
      isCompleted: json['isCompleted'] as bool,
      id: json['id'] as String,
      type: CourseMaterialTypeEntity.fromJson(json['type'] as String),
      title: json['title'] as String,
    );

Map<String, dynamic> _$CourseMaterialEntityToJson(
        CourseMaterialEntity instance) =>
    <String, dynamic>{
      'key': instance.key,
      'isCompleted': instance.isCompleted,
      'id': instance.id,
      'type': instance.type.toJson(),
      'title': instance.title,
    };
