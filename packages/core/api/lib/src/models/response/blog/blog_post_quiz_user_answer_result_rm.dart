import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_quiz_user_answer_result_rm.g.dart';

@JsonSerializable(createToJson: false)
class BlogPostQuizUserAnswerResultRM extends Equatable {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "score")
  final int? score;

  @JsonKey(name: "acceptable_score")
  final int? acceptableScore;

  @JsonKey(name: "proceed_message")
  final String? proceedMessage;

  @JsonKey(name: "text")
  final String? text;

  @JsonKey(name: "surveys")
  final List<BlogPostQuizQuestionRM>? questions;

  const BlogPostQuizUserAnswerResultRM({
    this.message,
    this.score,
    this.acceptableScore,
    this.proceedMessage,
    this.text,
    this.questions,
  });

  @override
  List<Object?> get props => [
    message,
    score,
    acceptableScore,
    proceedMessage,
    text,
    questions,
  ];

  factory BlogPostQuizUserAnswerResultRM.fromJson(Map<String, dynamic> json) =>
      _$BlogPostQuizUserAnswerResultRMFromJson(json);

  BlogPostQuizUserAnswerResult toDomainModel() {
    return BlogPostQuizUserAnswerResult(
      message: message ?? "",
      score: score ?? 0,
      acceptableScore: acceptableScore ?? 0,
      proceedMessage: proceedMessage ?? "",
      text: text ?? "",
      questions: questions?.map((e) => e.toDomainModel()).toList() ?? [],
    );
  }
}
