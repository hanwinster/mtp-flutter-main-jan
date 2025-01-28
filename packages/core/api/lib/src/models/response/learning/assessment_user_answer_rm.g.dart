// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_user_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentUserAnswerRM _$AssessmentUserAnswerRMFromJson(
        Map<String, dynamic> json) =>
    AssessmentUserAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      assessmentQuestionId:
          (json['assessment_question_answer_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      answers: json['answers'],
      score: (json['score'] as num?)?.toInt(),
      attempts: (json['attempts'] as num?)?.toInt(),
      status: json['status'] as String?,
      overallScore: json['overall_score'],
      comment: json['comment'] as String?,
      commentBy: json['comment_by'],
      passOption: json['pass_option'] == null
          ? null
          : AssessmentUserAnswerPassOptionRM.fromJson(
              json['pass_option'] as String),
      attachFile: json['attach_file'] as String?,
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
    );
