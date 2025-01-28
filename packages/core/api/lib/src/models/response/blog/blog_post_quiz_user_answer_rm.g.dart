// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_quiz_user_answer_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostQuizUserAnswerRM _$BlogPostQuizUserAnswerRMFromJson(
        Map<String, dynamic> json) =>
    BlogPostQuizUserAnswerRM(
      id: (json['id'] as num?)?.toInt(),
      questionId: (json['blog_survey_id'] as num?)?.toInt(),
      postId: (json['blog_id'] as num?)?.toInt(),
      answers: json['answers'],
      score: (json['score'] as num?)?.toInt(),
      attempts: (json['attempts'] as num?)?.toInt(),
      status: json['status'] as String?,
      overallScore: json['overall_score'],
    );
