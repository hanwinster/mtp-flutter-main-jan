// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationResponseRM _$EvaluationResponseRMFromJson(
        Map<String, dynamic> json) =>
    EvaluationResponseRM(
      evaluationQuestions: (json['evaluation_questions'] as List<dynamic>?)
          ?.map((e) => EvaluationQuestionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      agreeLevels: (json['agree_levels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      likelyLevels: (json['likely_levels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      excellentLevels: (json['excellent_levels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      deviceOptions: (json['device_options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );
