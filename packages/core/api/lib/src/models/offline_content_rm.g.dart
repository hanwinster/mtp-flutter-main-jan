// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_content_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineContentRM _$OfflineContentRMFromJson(Map<String, dynamic> json) =>
    OfflineContentRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      titleMM: json['title_mm'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => StepRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      slug: json['slug'] as String?,
      published: (json['published'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
