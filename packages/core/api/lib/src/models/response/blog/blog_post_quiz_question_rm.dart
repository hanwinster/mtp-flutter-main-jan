import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_quiz_question_rm.g.dart';

@JsonSerializable(createToJson: false)
class BlogPostQuizQuestionRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "blog_id")
  final int? postId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "explination")
  final String? explanation;
  @JsonKey(name: "answers")
  final List<String?>? options;
  @JsonKey(name: "right_answers")
  final List<String?>? correctAnswers;
  @JsonKey(name: "type", unknownEnumValue: BlogPostQuizQuestionTypeRM.unknown)
  final BlogPostQuizQuestionTypeRM? type;
  @JsonKey(name: 'blog_survey_current_users')
  final List<BlogPostQuizUserAnswerRM>? userAnswers;

  const BlogPostQuizQuestionRM({
    this.id,
    this.postId,
    this.userId,
    this.question,
    this.explanation,
    this.options,
    this.correctAnswers,
    this.type,
    this.userAnswers,
  });

  @override
  List<Object?> get props => [
        id,
        postId,
        userId,
        question,
        explanation,
        options,
        correctAnswers,
        type,
        userAnswers,
      ];

  factory BlogPostQuizQuestionRM.fromJson(Map<String, dynamic> json) =>
      _$BlogPostQuizQuestionRMFromJson(json);

  BlogPostQuizQuestion toDomainModel() {
    return BlogPostQuizQuestion(
      id: id?.toString() ?? (throw Exception("id is null")),
      question: question ?? '',
      explanation: explanation ?? '',
      options:
          options?.map((e) => e ?? '').whereNot((e) => e.isEmpty).toList() ??
              [],
      correctAnswers: correctAnswers
              ?.map((e) => e ?? '')
              .whereNot((e) => e.isEmpty)
              .toList() ??
          [],
      type: type?.toDomainModel() ?? BlogPostQuizQuestionType.unknown,
      userAnswer: userAnswers?.firstOrNull?.toDomainModel(),
    );
  }
}
