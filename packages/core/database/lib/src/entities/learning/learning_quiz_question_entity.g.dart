// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizShortQuestionEntity _$LearningQuizShortQuestionEntityFromJson(
        Map<String, dynamic> json) =>
    LearningQuizShortQuestionEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      answer: LearningQuizShortQuestionAnswerEntity.fromJson(
          json['answer'] as Map<String, dynamic>),
      type: json['type'] == null
          ? LearningQuizTypeEntity.shortQuestion
          : LearningQuizTypeEntity.fromJson(json['type'] as String),
    );

Map<String, dynamic> _$LearningQuizShortQuestionEntityToJson(
        LearningQuizShortQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'answer': instance.answer.toJson(),
    };

LearningQuizLongQuestionEntity _$LearningQuizLongQuestionEntityFromJson(
        Map<String, dynamic> json) =>
    LearningQuizLongQuestionEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      answer: LearningQuizLongQuestionAnswerEntity.fromJson(
          json['answer'] as Map<String, dynamic>),
      type: json['type'] == null
          ? LearningQuizTypeEntity.longQuestion
          : LearningQuizTypeEntity.fromJson(json['type'] as String),
    );

Map<String, dynamic> _$LearningQuizLongQuestionEntityToJson(
        LearningQuizLongQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'answer': instance.answer.toJson(),
    };

LearningQuizTrueFalseQuestionEntity
    _$LearningQuizTrueFalseQuestionEntityFromJson(Map<String, dynamic> json) =>
        LearningQuizTrueFalseQuestionEntity(
          id: json['id'] as String,
          title: json['title'] as String,
          explanation: json['explanation'] as String,
          answer: LearningQuizTrueFalseAnswerEntity.fromJson(
              json['answer'] as Map<String, dynamic>),
          type: json['type'] == null
              ? LearningQuizTypeEntity.trueFalse
              : LearningQuizTypeEntity.fromJson(json['type'] as String),
        );

Map<String, dynamic> _$LearningQuizTrueFalseQuestionEntityToJson(
        LearningQuizTrueFalseQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'answer': instance.answer.toJson(),
    };

LearningQuizMatchingQuestionEntity _$LearningQuizMatchingQuestionEntityFromJson(
        Map<String, dynamic> json) =>
    LearningQuizMatchingQuestionEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      answer: LearningQuizMatchingAnswerEntity.fromJson(
          json['answer'] as Map<String, dynamic>),
      type: json['type'] == null
          ? LearningQuizTypeEntity.matching
          : LearningQuizTypeEntity.fromJson(json['type'] as String),
    );

Map<String, dynamic> _$LearningQuizMatchingQuestionEntityToJson(
        LearningQuizMatchingQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'answer': instance.answer.toJson(),
    };

LearningQuizMultipleChoiceQuestionEntity
    _$LearningQuizMultipleChoiceQuestionEntityFromJson(
            Map<String, dynamic> json) =>
        LearningQuizMultipleChoiceQuestionEntity(
          id: json['id'] as String,
          title: json['title'] as String,
          explanation: json['explanation'] as String,
          answers: (json['answers'] as List<dynamic>)
              .map((e) => LearningQuizMultipleChoiceAnswerEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          type: json['type'] == null
              ? LearningQuizTypeEntity.multipleChoice
              : LearningQuizTypeEntity.fromJson(json['type'] as String),
        );

Map<String, dynamic> _$LearningQuizMultipleChoiceQuestionEntityToJson(
        LearningQuizMultipleChoiceQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

LearningQuizFillInTheBlankQuestionEntity
    _$LearningQuizFillInTheBlankQuestionEntityFromJson(
            Map<String, dynamic> json) =>
        LearningQuizFillInTheBlankQuestionEntity(
          id: json['id'] as String,
          title: json['title'] as String,
          explanation: json['explanation'] as String,
          answer: LearningQuizFillInTheBlankAnswerEntity.fromJson(
              json['answer'] as Map<String, dynamic>),
          type: json['type'] == null
              ? LearningQuizTypeEntity.fillInTheBlank
              : LearningQuizTypeEntity.fromJson(json['type'] as String),
        );

Map<String, dynamic> _$LearningQuizFillInTheBlankQuestionEntityToJson(
        LearningQuizFillInTheBlankQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'answer': instance.answer.toJson(),
    };

LearningQuizRearrangeQuestionEntity
    _$LearningQuizRearrangeQuestionEntityFromJson(Map<String, dynamic> json) =>
        LearningQuizRearrangeQuestionEntity(
          id: json['id'] as String,
          title: json['title'] as String,
          explanation: json['explanation'] as String,
          answer: LearningQuizRearrangeAnswerEntity.fromJson(
              json['answer'] as Map<String, dynamic>),
          type: json['type'] == null
              ? LearningQuizTypeEntity.rearrange
              : LearningQuizTypeEntity.fromJson(json['type'] as String),
        );

Map<String, dynamic> _$LearningQuizRearrangeQuestionEntityToJson(
        LearningQuizRearrangeQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'answer': instance.answer.toJson(),
    };

LearningQuizAssignmentQuestionEntity
    _$LearningQuizAssignmentQuestionEntityFromJson(Map<String, dynamic> json) =>
        LearningQuizAssignmentQuestionEntity(
          id: json['id'] as String,
          title: json['title'] as String,
          explanation: json['explanation'] as String,
          assignment: LearningQuizAssignmentEntity.fromJson(
              json['assignment'] as Map<String, dynamic>),
          attachedFileUrl: json['attached_file_url'] as String,
          userAnswer: json['user_answer'] == null
              ? null
              : LearningQuizAssignmentUserAnswerEntity.fromJson(
                  json['user_answer'] as Map<String, dynamic>),
          type: json['type'] == null
              ? LearningQuizTypeEntity.assignment
              : LearningQuizTypeEntity.fromJson(json['type'] as String),
        );

Map<String, dynamic> _$LearningQuizAssignmentQuestionEntityToJson(
        LearningQuizAssignmentQuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'explanation': instance.explanation,
      'type': instance.type.toJson(),
      'assignment': instance.assignment.toJson(),
      'attached_file_url': instance.attachedFileUrl,
      'user_answer': instance.userAnswer?.toJson(),
    };
