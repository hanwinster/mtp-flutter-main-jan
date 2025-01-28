// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_quiz_question_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostQuizQuestionRM _$BlogPostQuizQuestionRMFromJson(
        Map<String, dynamic> json) =>
    BlogPostQuizQuestionRM(
      id: (json['id'] as num?)?.toInt(),
      postId: (json['blog_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      question: json['question'] as String?,
      explanation: json['explination'] as String?,
      options: (json['answers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      correctAnswers: (json['right_answers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      type: json['type'] == null
          ? null
          : BlogPostQuizQuestionTypeRM.fromJson(json['type'] as String),
      userAnswers: (json['blog_survey_current_users'] as List<dynamic>?)
          ?.map((e) =>
              BlogPostQuizUserAnswerRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
