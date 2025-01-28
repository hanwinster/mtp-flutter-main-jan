import 'package:base/base.dart';

class BlogPostQuizUserAnswer extends Equatable {
  final String id;
  final List<String> answers;
  final int score;
  final int attempts;
  final String status;
  final double overallScore;

  const BlogPostQuizUserAnswer({
    required this.id,
    required this.answers,
    required this.score,
    required this.attempts,
    required this.status,
    required this.overallScore,
  });

  @override
  List<Object> get props => [id, score, attempts, status, overallScore];
}