import 'package:questionnaire_kit/questionnaire_kit.dart';

class RearrangeQuestionData extends QuestionData<UserOptionListAnswer> {
  const RearrangeQuestionData({
    required super.id,
    required super.content,
    super.getHint,
    super.explanation,
    required this.options,
    this.correctOrder = const [],
  });

  final List<AnswerOption> options;
  final List<AnswerOption> correctOrder;

  @override
  List<Object?> get props => super.props..addAll([options]);

  @override
  EvaluationQuestionResult evaluate(UserOptionListAnswer answer) {
    List<AnswerOption> userAnswerOrder = answer.options;
    if (userAnswerOrder.isEmpty) {
      // At least there is the default order
      userAnswerOrder = options;
    }

    final isCorrect = answer.options.map((option) => option.id).toList() ==
        correctOrder.map((option) => option.id).toList();

    final optionResultsByOptionId = <String, bool>{};
    for (final (index, option) in userAnswerOrder.indexed) {
      final correctIndex = correctOrder
          .indexWhere((correctOption) => correctOption.id == option.id);
      if (index == correctIndex) {
        optionResultsByOptionId[option.id] = true;
      } else {
        optionResultsByOptionId[option.id] = false;
      }
    }

    return EvaluationQuestionResultOptions(
      questionId: id,
      isCorrect: isCorrect,
      optionResultsByOptionId: optionResultsByOptionId,
      explanation: explanation,
    );
  }
}
