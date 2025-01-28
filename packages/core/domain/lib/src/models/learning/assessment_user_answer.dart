import 'package:base/base.dart';
import 'package:domain/domain.dart';

class AssessmentUserAnswer extends Equatable {
  final String id;
  final String questionId;
  final List<String> answers;
  final int score;
  final int attempts;
  final String status;
  final double overallScore;
  final String comment;
  final User? commentBy;
  final AssessmentUserAnswerPassOption passOption;
  final String attachFileUrl;

  const AssessmentUserAnswer({
    required this.id,
    required this.questionId,
    required this.answers,
    required this.score,
    required this.attempts,
    required this.status,
    required this.overallScore,
    required this.comment,
    required this.commentBy,
    required this.passOption,
    required this.attachFileUrl,
  });

  @override
  List<Object?> get props =>
      [
        id,
        questionId,
        answers,
        score,
        attempts,
        status,
        overallScore,
        comment,
        commentBy,
        passOption,
        attachFileUrl,
      ];
}
