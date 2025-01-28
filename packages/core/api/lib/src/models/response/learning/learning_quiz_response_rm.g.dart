// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizResponseRM _$LearningQuizResponseRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizResponseRM(
      quiz: json['quiz'] == null
          ? null
          : LearningQuizRM.fromJson(json['quiz'] as Map<String, dynamic>),
      assignmentMedia: json['assignment_media'] == null
          ? null
          : MediaRM.fromJson(json['assignment_media'] as Map<String, dynamic>),
    );
