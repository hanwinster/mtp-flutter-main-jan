import 'package:base/base.dart';

import 'evaluation_question_result.dart';

class EvaluationResult extends Equatable {
  final bool isCorrect;
  final List<EvaluationQuestionResult> questionResults;

  const EvaluationResult({
    required this.isCorrect,
    required this.questionResults,
  });

  @override
  List<Object> get props => [isCorrect, questionResults];

  bool get containsUnanswered => questionResults.any((result) => result is EvaluationQuestionResultUnanswered);
}