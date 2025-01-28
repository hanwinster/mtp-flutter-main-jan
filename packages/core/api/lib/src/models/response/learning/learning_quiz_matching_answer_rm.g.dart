// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_matching_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizMatchingAnswerRM _$LearningQuizMatchingAnswerRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizMatchingAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      answers: (json['answer'] as List<dynamic>?)
          ?.map((e) =>
              LearningQuizMatchingPairRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$LearningQuizMatchingAnswerRMToJson(
        LearningQuizMatchingAnswerRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'answer': instance.answers,
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };

LearningQuizMatchingPairRM _$LearningQuizMatchingPairRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizMatchingPairRM(
      questionLabel: json['name_first'] as String?,
      questionText: json['first'] as String?,
      answerLabel: json['name_second'] as String?,
      answerText: json['second'] as String?,
    );

Map<String, dynamic> _$LearningQuizMatchingPairRMToJson(
        LearningQuizMatchingPairRM instance) =>
    <String, dynamic>{
      'name_first': instance.questionLabel,
      'first': instance.questionText,
      'name_second': instance.answerLabel,
      'second': instance.answerText,
    };
