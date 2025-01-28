// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_long_question_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizLongQuestionAnswerEntity
    _$LearningQuizLongQuestionAnswerEntityFromJson(Map<String, dynamic> json) =>
        LearningQuizLongQuestionAnswerEntity(
          id: json['id'] as String,
          answer: json['answer'] as String,
          userAnswer: json['user_answer'] as String,
        );

Map<String, dynamic> _$LearningQuizLongQuestionAnswerEntityToJson(
        LearningQuizLongQuestionAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'user_answer': instance.userAnswer,
    };
