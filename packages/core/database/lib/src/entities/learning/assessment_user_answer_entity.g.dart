// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_user_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentUserAnswerEntity _$AssessmentUserAnswerEntityFromJson(
        Map<String, dynamic> json) =>
    AssessmentUserAnswerEntity(
      id: json['id'] as String,
      assessmentQuestionId: json['assessment_question_answer_id'] as String,
      courseId: json['course_id'] as String,
      userId: json['user_id'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      score: (json['score'] as num).toInt(),
      attempts: (json['attempts'] as num).toInt(),
      status: json['status'] as String,
      overallScore: (json['overall_score'] as num).toDouble(),
      comment: json['comment'] as String,
      commentBy: json['comment_by'] == null
          ? null
          : UserEntity.fromJson(json['comment_by'] as Map<String, dynamic>),
      passOption: json['pass_option'] == null
          ? null
          : AssessmentUserAnswerPassOptionEntity.fromJson(
              json['pass_option'] as String),
      attachFile: json['attach_file'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$AssessmentUserAnswerEntityToJson(
        AssessmentUserAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assessment_question_answer_id': instance.assessmentQuestionId,
      'course_id': instance.courseId,
      'user_id': instance.userId,
      'answers': instance.answers,
      'score': instance.score,
      'attempts': instance.attempts,
      'status': instance.status,
      'overall_score': instance.overallScore,
      'comment': instance.comment,
      'comment_by': instance.commentBy?.toJson(),
      'pass_option': instance.passOption?.toJson(),
      'attach_file': instance.attachFile,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': const DateTimeStringConverter().toJson(instance.updatedAt),
    };
