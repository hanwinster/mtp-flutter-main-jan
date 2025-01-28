// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectRM _$SubjectRMFromJson(Map<String, dynamic> json) => SubjectRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      published: (json['published'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
