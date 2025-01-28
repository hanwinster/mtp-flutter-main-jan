// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizRM _$LearningQuizRMFromJson(Map<String, dynamic> json) =>
    LearningQuizRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      courseId: (json['course_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      lectureId: (json['lecture_id'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : LearningQuizTypeRM.fromJson(json['type'] as String),
      isTryAgain: (json['is_try_again'] as num?)?.toInt(),
      questions: (json['questions'] as List<dynamic>?)
          ?.map(
              (e) => LearningQuizQuestionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
