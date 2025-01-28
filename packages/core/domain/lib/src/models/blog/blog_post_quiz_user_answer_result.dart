import 'package:base/base.dart';
import 'package:domain/domain.dart';

class BlogPostQuizUserAnswerResult extends Equatable {
  final String message;
  final int score;
  final int acceptableScore;
  final String proceedMessage;
  final String text;
  final List<BlogPostQuizQuestion> questions;

  const BlogPostQuizUserAnswerResult({
    required this.message,
    required this.score,
    required this.acceptableScore,
    required this.proceedMessage,
    required this.text,
    required this.questions,
  });

  bool get isPass => score >= acceptableScore;

  @override
  List<Object> get props => [
        message,
        score,
        acceptableScore,
        proceedMessage,
        text,
        questions,
      ];

  BlogPostQuizUserAnswerResult copyWith({
    String? message,
    int? score,
    int? acceptableScore,
    String? proceedMessage,
    String? text,
    List<BlogPostQuizQuestion>? questions,
  }) {
    return BlogPostQuizUserAnswerResult(
      message: message ?? this.message,
      score: score ?? this.score,
      acceptableScore: acceptableScore ?? this.acceptableScore,
      proceedMessage: proceedMessage ?? this.proceedMessage,
      text: text ?? this.text,
      questions: questions ?? this.questions,
    );
  }
}
