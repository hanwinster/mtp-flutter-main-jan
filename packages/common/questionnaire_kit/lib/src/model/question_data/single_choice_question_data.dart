import 'package:questionnaire_kit/questionnaire_kit.dart';

class SingleChoiceQuestionData extends QuestionData<UserOptionAnswer> {
  final List<AnswerOption> options;
  final AnswerOption? correctOption;

  const SingleChoiceQuestionData({
    required super.id,
    required super.content,
    super.getHint,
    super.explanation,
    required this.options,
    this.correctOption,
  });

  @override
  List<Object?> get props => [...super.props, options];

  @override
  EvaluationQuestionResult evaluate(UserOptionAnswer answer) {
    if (correctOption == null) {
      return EvaluationQuestionResultUnknown(questionId: id);
    }

    bool isCorrect = false;
    if (answer.option.id == correctOption?.id) {
      isCorrect = true;
    }

    return EvaluationQuestionResultOptions(
      questionId: id,
      isCorrect: isCorrect,
      optionResultsByOptionId: {answer.option.id: isCorrect},
      explanation: explanation,
    );
  }
}