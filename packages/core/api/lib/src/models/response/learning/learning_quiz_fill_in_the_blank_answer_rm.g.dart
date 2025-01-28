// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_fill_in_the_blank_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizFillInTheBlankAnswerRM _$LearningQuizFillInTheBlankAnswerRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizFillInTheBlankAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['question_id'] as num?)?.toInt(),
      commaSeparatedOptionalKeywords: json['optional_keywords'] as String?,
      paragraph: (json['paragraph_formatted'] as List<dynamic>?)
          ?.map((e) => LearningQuizFillInTheBlankPartRM.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$LearningQuizFillInTheBlankAnswerRMToJson(
        LearningQuizFillInTheBlankAnswerRM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'optional_keywords': instance.commaSeparatedOptionalKeywords,
      'paragraph_formatted': instance.paragraph,
      'created_at': const DateTimeStringConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };

LearningQuizFillInTheBlankPartRM _$LearningQuizFillInTheBlankPartRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizFillInTheBlankPartRM(
      sentence: json['sentence'] as String?,
      blank: json['blank'] as String?,
    );

Map<String, dynamic> _$LearningQuizFillInTheBlankPartRMToJson(
        LearningQuizFillInTheBlankPartRM instance) =>
    <String, dynamic>{
      'sentence': instance.sentence,
      'blank': instance.blank,
    };
