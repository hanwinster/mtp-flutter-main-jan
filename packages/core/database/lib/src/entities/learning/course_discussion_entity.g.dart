// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_discussion_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDiscussionEntity _$CourseDiscussionEntityFromJson(
        Map<String, dynamic> json) =>
    CourseDiscussionEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      allowTakers: json['allow_takers'] as bool,
      allowLearners: json['allow_learners'] as bool,
      courseId: json['course_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$CourseDiscussionEntityToJson(
        CourseDiscussionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'allow_takers': instance.allowTakers,
      'allow_learners': instance.allowLearners,
      'course_id': instance.courseId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };
