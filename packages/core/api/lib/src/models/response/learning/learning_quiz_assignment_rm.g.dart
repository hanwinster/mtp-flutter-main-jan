// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_assignment_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizAssignmentRM _$LearningQuizAssignmentRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizAssignmentRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$LearningQuizAssignmentRMToJson(
        LearningQuizAssignmentRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };
