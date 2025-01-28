import 'package:questionnaire_kit/questionnaire_kit.dart';

class LongTextInputQuestionData extends QuestionData<UserTextAnswer> {
  const LongTextInputQuestionData({
    required super.id,
    required super.content,
    super.getHint,
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