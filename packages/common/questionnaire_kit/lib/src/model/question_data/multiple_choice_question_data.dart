import 'package:questionnaire_kit/questionnaire_kit.dart';

class MultipleChoiceQuestionData extends QuestionData<UserOptionListAnswer> {
  final List<AnswerOption> options;
  final List<AnswerOption> correctOptions;

  const MultipleChoiceQuestionData({
    required super.id,
    required super.content,
    super.getHint,
    required this.options,
    super.explanation,
    this.correctOptions = const [],
  });

  @override
  List<Object?> get props => [...super.props, options];

  @override
  EvaluationQuestionResult evaluate(UserOptionListAnswer answer) {
    if (correctOptions.isEmpty) {
      return EvaluationQuestionResultUnknown(questionId: id);
    }

    final optionResultsByOptionId = <String, bool>{};
    for (final answerOption in answer.options) {
      final isCorrect = correctOptions.any((correctOption) => correctOption.id == answerOption.id);
      optionResultsByOptionId[answerOption.id] = isCorrect;
    }

    return EvaluationQuestionResultOptions(
      questionId: id,
      isCorrect: optionResultsByOptionId.values.every((correct) => correct),
      optionResultsByOptionId: optionResultsByOptionId,
      explanation: explanation,
    );
  }
}
