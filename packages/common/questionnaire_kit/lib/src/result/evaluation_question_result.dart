import 'package:base/base.dart';

sealed class EvaluationQuestionResult extends Equatable {
  const EvaluationQuestionResult({
    required this.questionId,
    required this.isCorrect,
    required this.explanation,
  });

  final String questionId;
  final bool isCorrect;
  final String explanation;

  bool get isIncorrect => !isCorrect;

  @override
  List<Object> get props => [questionId, isCorrect, explanation];
}

class EvaluationQuestionResultText extends EvaluationQuestionResult {
  const EvaluationQuestionResultText({
    required this.text,
    required super.questionId,
    required super.isCorrect,
    required super.explanation,
  });

  final String text;

  @override
  List<Object> get props => super.props..addAll([text]);
}

class EvaluationQuestionResultOptions extends EvaluationQuestionResult {
  const EvaluationQuestionResultOptions({
    required super.questionId,
    required super.isCorrect,
    required super.explanation,
    required this.optionResultsByOptionId,
  });

  final Map<String, bool> optionResultsByOptionId;

  @override
  List<Object> get props => super.props..addAll([optionResultsByOptionId]);
}

class EvaluationQuestionResultUnanswered extends EvaluationQuestionResult {
  const EvaluationQuestionResultUnanswered({
    required super.questionId,
    super.isCorrect = false,
    super.explanation = '',
  });
}

class EvaluationQuestionResultUnknown extends EvaluationQuestionResult {
  const EvaluationQuestionResultUnknown({
    required super.questionId,
    super.isCorrect = false,
    super.explanation = '',
  });
}

extension EvaluationQuestionResultExtensions on EvaluationQuestionResult {

  Map<String, bool> get optionResultsByOptionId {
    if (this is EvaluationQuestionResultOptions) {
      return (this as EvaluationQuestionResultOptions).optionResultsByOptionId;
    }
    return {};
  }
}