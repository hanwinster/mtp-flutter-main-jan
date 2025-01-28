// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_true_false_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizTrueFalseAnswerRM _$LearningQuizTrueFalseAnswerRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizTrueFalseAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      answer: json['answer'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$LearningQuizTrueFalseAnswerRMToJson(
        LearningQuizTrueFalseAnswerRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'answer': instance.answer,
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };
