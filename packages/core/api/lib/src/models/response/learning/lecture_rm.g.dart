// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureRM _$LectureRMFromJson(Map<String, dynamic> json) => LectureRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['lecture_title'] as String?,
      description: json['description'] as String?,
      resourceType: json['resource_type'] == null
          ? null
          : LectureResourceTypeRM.fromJson(json['resource_type'] as String),
      videoLink: json['video_link'] as String?,
      resourceLink: json['resource_link'] as String?,
      attachedFile: json['attached_file'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      quizzes: (json['quizzes'] as List<dynamic>?)
          ?.map((e) => LearningQuizRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      summaries: (json['summaries'] as List<dynamic>?)
          ?.map((e) => LearningSummaryRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      liveSessions: (json['live_sessions'] as List<dynamic>?)
          ?.map((e) => LiveSessionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      learningActivities: (json['learning_activities'] as List<dynamic>?)
          ?.map((e) => LearningActivityRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      interactiveFeatures: (json['interactive_features'] as List<dynamic>?)
          ?.map((e) => InteractiveFeatureRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );
