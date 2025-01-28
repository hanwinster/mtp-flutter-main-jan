// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_question_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentQuestionRM _$AssessmentQuestionRMFromJson(
        Map<String, dynamic> json) =>
    AssessmentQuestionRM(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      question: json['question'] as String?,
      options: json['answers'] as List<dynamic>?,
      correctAnswers: json['right_answers'] as List<dynamic>?,
      order: (json['order'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : AssessmentQuestionTypeRM.fromJson(json['type'] as String),
      passingOption: json['passing_option'] == null
          ? null
          : AssessmentQuestionPassingOptionRM.fromJson(
              json['passing_option'] as String),
      createdAt: const DateTimeStringConverter()
          .fromJson(json['created_at'] as String?),
      updatedAt: const DateTimeStringConverter()
          .fromJson(json['updated_at'] as String?),
      userAnswers: (json['current_assessment_user'] as List<dynamic>?)
          ?.map(
              (e) => AssessmentUserAnswerRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
