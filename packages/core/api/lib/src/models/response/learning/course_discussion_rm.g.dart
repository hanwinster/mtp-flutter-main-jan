// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_discussion_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDiscussionRM _$CourseDiscussionRMFromJson(Map<String, dynamic> json) =>
    CourseDiscussionRM(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      allowTakers: (json['allow_takers'] as num?)?.toInt(),
      allowLearners: (json['allow_learners'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );
