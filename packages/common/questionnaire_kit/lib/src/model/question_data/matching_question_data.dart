import 'package:questionnaire_kit/questionnaire_kit.dart';

class MatchingQuestionData extends QuestionData<UserOptionMapAnswer> {
  final List<AnswerOption> prompts;
  final List<AnswerOption> options;
  final Map<AnswerOption, AnswerOption>? correctOptionsByPrompt;

  const MatchingQuestionData({
    required super.id,
    required super.content,
    required this.prompts,
    required this.options,
    super.explanation,
    super.getHint,
    this.correctOptionsByPrompt,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        prompts,
        options,
        correctOptionsByPrompt,
      ];

  @override
  EvaluationQuestionResult evaluate(UserOptionMapAnswer answer) {
    if (answer.optionsByPrompt.isEmpty) {
      return EvaluationQuestionResultUnknown(questionId: id);
    }

    final optionResultsByOptionId = <String, bool>{};
    for (final userAnswerEntry in answer.optionsByPrompt.entries) {
      final userAnswerPrompt = userAnswerEntry.key;
      final userAnswerOption = userAnswerEntry.value;

      final correctOption = correctOptionsByPrompt?[userAnswerPrompt];

      final isCorrect =
          correctOption != null && correctOption.id == userAnswerOption.id;
      optionResultsByOptionId[userAnswerOption.id] = isCorrect;
    }

    final isAllCorrect =
        optionResultsByOptionId.values.every((correct) => correct);

    return EvaluationQuestionResultOptions(
      questionId: id,
      isCorrect: isAllCorrect,
      optionResultsByOptionId: optionResultsByOptionId,
      explanation: explanation,
    );
  }
}
