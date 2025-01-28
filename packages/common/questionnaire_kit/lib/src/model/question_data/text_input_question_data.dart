import 'package:questionnaire_kit/questionnaire_kit.dart';

class TextInputQuestionData extends QuestionData<UserTextAnswer> {
  const TextInputQuestionData({
    required super.id,
    required super.content,
    super.explanation,
  });

  @override
  EvaluationQuestionResult evaluate(UserTextAnswer answer) {
    if (answer.text.isEmpty) {
      return EvaluationQuestionResultUnanswered(questionId: id);
    }

    return EvaluationQuestionResultText(
      questionId: id,
      isCorrect: true,
      explanation: explanation,
      text: answer.text,
    );
  }
}
