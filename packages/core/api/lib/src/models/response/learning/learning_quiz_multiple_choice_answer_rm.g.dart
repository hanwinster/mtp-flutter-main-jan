// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_multiple_choice_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizMultipleChoiceAnswerRM _$LearningQuizMultipleChoiceAnswerRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizMultipleChoiceAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      answerLabel: json['name'] as String?,
      answerText: json['answer'] as String?,
      isCorrectAnswer: (json['is_right_answer'] as num?)?.toInt(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$LearningQuizMultipleChoiceAnswerRMToJson(
        LearningQuizMultipleChoiceAnswerRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'name': instance.answerLabel,
      'answer': instance.answerText,
      'is_right_answer': instance.isCorrectAnswer,
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };
