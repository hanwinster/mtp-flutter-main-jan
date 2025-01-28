// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideRM _$SlideRMFromJson(Map<String, dynamic> json) => SlideRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      published: (json['published'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      slide: json['slides'] == null
          ? null
          : SlideImageRM.fromJson(json['slides'] as Map<String, dynamic>),
    );
