// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_quiz_user_answer_result_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostQuizUserAnswerResultRM _$BlogPostQuizUserAnswerResultRMFromJson(
        Map<String, dynamic> json) =>
    BlogPostQuizUserAnswerResultRM(
      message: json['message'] as String?,
      score: (json['score'] as num?)?.toInt(),
      acceptableScore: (json['acceptable_score'] as num?)?.toInt(),
      proceedMessage: json['proceed_message'] as String?,
      text: json['text'] as String?,
      questions: (json['surveys'] as List<dynamic>?)
          ?.map(
              (e) => BlogPostQuizQuestionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
