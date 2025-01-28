// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_material_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseMaterialRM _$CourseMaterialRMFromJson(Map<String, dynamic> json) =>
    CourseMaterialRM(
      key: json['key'] as String?,
      isCompleted: (json['isCompleted'] as num?)?.toInt(),
      id: json['id'],
      type: json['type'] == null
          ? null
          : CourseMaterialTypeRM.fromJson(json['type'] as String),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CourseMaterialRMToJson(CourseMaterialRM instance) =>
    <String, dynamic>{
      'key': instance.key,
      'isCompleted': instance.isCompleted,
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
    };
