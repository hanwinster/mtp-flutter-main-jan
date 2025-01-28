// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_question_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationQuestionRM _$EvaluationQuestionRMFromJson(
        Map<String, dynamic> json) =>
    EvaluationQuestionRM(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      order: (json['order'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : EvaluationQuestionTypeRM.fromJson(json['type'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
