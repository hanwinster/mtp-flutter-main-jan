// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_summary_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningSummaryRM _$LearningSummaryRMFromJson(Map<String, dynamic> json) =>
    LearningSummaryRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      courseId: (json['course_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      lectureId: (json['lecture_id'] as num?)?.toInt(),
      mediaList: (json['summary_media'] as List<dynamic>?)
          ?.map((e) => MediaRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      interactiveFeatures: (json['interactive_features'] as List<dynamic>?)
          ?.map((e) => InteractiveFeatureRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
