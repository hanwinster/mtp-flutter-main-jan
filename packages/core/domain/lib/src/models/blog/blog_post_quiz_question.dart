import 'package:base/base.dart';
import 'package:domain/domain.dart';

class BlogPostQuizQuestion extends Equatable {
  final String id;
  final String question;
  final String explanation;
  final BlogPostQuizQuestionType type;
  final List<String> options;
  final List<String> correctAnswers;
  final BlogPostQuizUserAnswer? userAnswer;

  const BlogPostQuizQuestion({
    required this.id,
    required this.question,
    required this.explanation,
    required this.type,
    required this.options,
    required this.correctAnswers,
    required this.userAnswer,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        explanation,
        type,
        options,
        correctAnswers,
        userAnswer,
      ];

  BlogPostQuizQuestion copyWith({
    String? id,
    String? question,
    String? explanation,
    BlogPostQuizQuestionType? type,
    List<String>? options,
    List<String>? correctAnswers,
    BlogPostQuizUserAnswer? userAnswer,
  }) {
    return BlogPostQuizQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      explanation: explanation ?? this.explanation,
      type: type ?? this.type,
      options: options ?? this.options,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      userAnswer: userAnswer ?? this.userAnswer,
    );
  }
}
