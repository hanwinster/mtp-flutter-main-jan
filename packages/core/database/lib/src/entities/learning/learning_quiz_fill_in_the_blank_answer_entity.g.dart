// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_fill_in_the_blank_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizFillInTheBlankAnswerEntity
    _$LearningQuizFillInTheBlankAnswerEntityFromJson(
            Map<String, dynamic> json) =>
        LearningQuizFillInTheBlankAnswerEntity(
          id: json['id'] as String,
          correctAnswers: (json['correct_answers'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          optionalKeywords: (json['optional_keywords'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          parts: (json['parts'] as List<dynamic>)
              .map((e) => LearningQuizFillInTheBlankPartEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$LearningQuizFillInTheBlankAnswerEntityToJson(
        LearningQuizFillInTheBlankAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correct_answers': instance.correctAnswers,
      'optional_keywords': instance.optionalKeywords,
      'parts': instance.parts.map((e) => e.toJson()).toList(),
    };
