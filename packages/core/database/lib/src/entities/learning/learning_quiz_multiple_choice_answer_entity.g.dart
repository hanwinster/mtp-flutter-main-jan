// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_multiple_choice_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizMultipleChoiceAnswerEntity
    _$LearningQuizMultipleChoiceAnswerEntityFromJson(
            Map<String, dynamic> json) =>
        LearningQuizMultipleChoiceAnswerEntity(
          id: json['id'] as String,
          answerLabel: json['answer_label'] as String,
          answerText: json['answer_text'] as String,
          isCorrectAnswer: json['is_correct_answer'] as bool,
        );

Map<String, dynamic> _$LearningQuizMultipleChoiceAnswerEntityToJson(
        LearningQuizMultipleChoiceAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer_label': instance.answerLabel,
      'answer_text': instance.answerText,
      'is_correct_answer': instance.isCorrectAnswer,
    };
