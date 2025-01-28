// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_rearrange_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizRearrangeAnswerRM _$LearningQuizRearrangeAnswerRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizRearrangeAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      options:
          (json['answer'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$LearningQuizRearrangeAnswerRMToJson(
        LearningQuizRearrangeAnswerRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'answer': instance.options,
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };
