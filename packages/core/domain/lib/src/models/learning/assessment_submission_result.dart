import 'package:base/base.dart';

class AssessmentSubmissionResult extends Equatable {
  final String message;
  final double score;
  final bool isPass;
  final double acceptableScore;
  final String proceedMessage;

  const AssessmentSubmissionResult({
    required this.message,
    required this.score,
    required this.isPass,
    required this.acceptableScore,
    required this.proceedMessage,
  });

  @override
  List<Object?> get props =>
      [message, score, isPass, acceptableScore, proceedMessage,];

}
