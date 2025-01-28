// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_long_question_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizLongQuestionAnswerRM _$LearningQuizLongQuestionAnswerRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizLongQuestionAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      answer: json['answer'] as String?,
      userAnswer: json['user_answer'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$LearningQuizLongQuestionAnswerRMToJson(
        LearningQuizLongQuestionAnswerRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'answer': instance.answer,
      'user_answer': instance.userAnswer,
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };
