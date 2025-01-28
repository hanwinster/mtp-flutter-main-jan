// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_quiz_question_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningQuizQuestionRM _$LearningQuizQuestionRMFromJson(
        Map<String, dynamic> json) =>
    LearningQuizQuestionRM(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      explanation: json['description'] as String?,
      quizId: (json['quiz_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      matchingAnswer: json['matching_answer'] == null
          ? null
          : LearningQuizMatchingAnswerRM.fromJson(
              json['matching_answer'] as Map<String, dynamic>),
      multipleChoiceAnswers: (json['multiple_answers'] as List<dynamic>?)
          ?.map((e) => LearningQuizMultipleChoiceAnswerRM.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      shortAnswers: (json['short_answer'] as List<dynamic>?)
          ?.map((e) => LearningQuizShortQuestionAnswerRM.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      longAnswer: json['long_answer'] == null
          ? null
          : LearningQuizLongQuestionAnswerRM.fromJson(
              json['long_answer'] as Map<String, dynamic>),
      trueFalseAnswer: json['true_false_answer'] == null
          ? null
          : LearningQuizTrueFalseAnswerRM.fromJson(
              json['true_false_answer'] as Map<String, dynamic>),
      fillInTheBlankAnswer: json['blank_answer'] == null
          ? null
          : LearningQuizFillInTheBlankAnswerRM.fromJson(
              json['blank_answer'] as Map<String, dynamic>),
      rearrangeAnswer: json['rearrange_answer'] == null
          ? null
          : LearningQuizRearrangeAnswerRM.fromJson(
              json['rearrange_answer'] as Map<String, dynamic>),
      assignment: json['assignment'] == null
          ? null
          : LearningQuizAssignmentRM.fromJson(
              json['assignment'] as Map<String, dynamic>),
      attachedFileUrl: json['attached_file'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
