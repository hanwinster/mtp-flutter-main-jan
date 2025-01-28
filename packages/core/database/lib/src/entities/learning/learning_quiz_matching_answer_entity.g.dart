// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_matching_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizMatchingAnswerEntity _$LearningQuizMatchingAnswerEntityFromJson(
        Map<String, dynamic> json) =>
    LearningQuizMatchingAnswerEntity(
      id: json['id'] as String,
      pairs: (json['pairs'] as List<dynamic>)
          .map((e) => LearningQuizMatchingPairEntity.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LearningQuizMatchingAnswerEntityToJson(
        LearningQuizMatchingAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pairs': instance.pairs.map((e) => e.toJson()).toList(),
    };

LearningQuizMatchingPairEntity _$LearningQuizMatchingPairEntityFromJson(
        Map<String, dynamic> json) =>
    LearningQuizMatchingPairEntity(
      questionLabel: json['question_label'] as String,
      questionText: json['question_text'] as String,
      answerLabel: json['answer_label'] as String,
      answerText: json['answer_text'] as String,
    );

Map<String, dynamic> _$LearningQuizMatchingPairEntityToJson(
        LearningQuizMatchingPairEntity instance) =>
    <String, dynamic>{
      'question_label': instance.questionLabel,
      'question_text': instance.questionText,
      'answer_label': instance.answerLabel,
      'answer_text': instance.answerText,
    };
