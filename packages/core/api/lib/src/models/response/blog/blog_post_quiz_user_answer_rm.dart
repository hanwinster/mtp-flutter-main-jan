import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_post_quiz_user_answer_rm.g.dart';

@JsonSerializable(createToJson: false)
class BlogPostQuizUserAnswerRM extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "blog_survey_id")
  final int? questionId;
  @JsonKey(name: "blog_id")
  final int? postId;
  @JsonKey(name: "answers")
  final dynamic answers;
  @JsonKey(name: "score")
  final int? score;
  @JsonKey(name: "attempts")
  final int? attempts;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "overall_score")
  final dynamic overallScore;

  const BlogPostQuizUserAnswerRM({
    this.id,
    this.questionId,
    this.postId,
    this.answers,
    this.score,
    this.attempts,
    this.status,
    this.overallScore,
  });

  @override
  List<Object?> get props =>
      [
        id,
        questionId,
        postId,
        answers,
        score,
        attempts,
        status,
        overallScore,
      ];

  BlogPostQuizUserAnswerRM copyWith({
    int? id,
    int? questionId,
    int? postId,
    List<String>? answers,
    int? score,
    int? attempts,
    String? status,
    dynamic overallScore,
  }) {
    return BlogPostQuizUserAnswerRM(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      postId: postId ?? this.postId,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      attempts: attempts ?? this.attempts,
      status: status ?? this.status,
      overallScore: overallScore ?? this.overallScore,
    );
  }

  factory BlogPostQuizUserAnswerRM.fromJson(Map<String, dynamic> json) =>
      _$BlogPostQuizUserAnswerRMFromJson(json);

  BlogPostQuizUserAnswer toDomainModel() {
    return BlogPostQuizUserAnswer(
      id: id?.toString() ?? (throw Exception("id is null")),
      answers: _mapAnswers(),
      score: score ?? 0,
      attempts: attempts ?? 0,
      status: status ?? '',
      overallScore: overallScore != null ? (double.tryParse(overallScore) ?? 0) : 0,
    );
  }

  List<String> _mapAnswers() {
    if (answers is Map) {
      return (answers as Map).values.map((e) => e.toString()).toList();
    } else if (answers is List) {
      return (answers as List).map((e) => e.toString()).toList();
    } else {
      return [];
    }
  }
}
