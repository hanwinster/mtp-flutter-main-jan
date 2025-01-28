// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_short_question_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizShortQuestionAnswerEntity
    _$LearningQuizShortQuestionAnswerEntityFromJson(
            Map<String, dynamic> json) =>
        LearningQuizShortQuestionAnswerEntity(
          id: json['id'] as String,
          answer: json['answer'] as String,
          userAnswer: json['user_answer'] as String,
        );

Map<String, dynamic> _$LearningQuizShortQuestionAnswerEntityToJson(
        LearningQuizShortQuestionAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'user_answer': instance.userAnswer,
    };
