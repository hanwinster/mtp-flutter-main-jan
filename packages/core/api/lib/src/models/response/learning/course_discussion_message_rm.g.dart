// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_discussion_message_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDiscussionMessageRM _$CourseDiscussionMessageRMFromJson(
        Map<String, dynamic> json) =>
    CourseDiscussionMessageRM(
      id: (json['id'] as num?)?.toInt(),
      discussionId: (json['discussion_id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserRM.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );
