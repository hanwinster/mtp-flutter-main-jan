// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_rearrange_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizRearrangeAnswerEntity _$LearningQuizRearrangeAnswerEntityFromJson(
        Map<String, dynamic> json) =>
    LearningQuizRearrangeAnswerEntity(
      id: json['id'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctOrder: (json['correct_order'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LearningQuizRearrangeAnswerEntityToJson(
        LearningQuizRearrangeAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'options': instance.options,
      'correct_order': instance.correctOrder,
    };
