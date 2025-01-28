import '../../questionnaire_kit.dart';
import '../bloc/question_sheet_bloc.dart';

class QuestionSheetController {
  final QuestionSheetBloc bloc;

  QuestionSheetController({
    List<QuestionData> questions = const [],
  }) : bloc = QuestionSheetBloc(questions: questions) {
    _populateRearrangeAnswers(questions);
  }

  void setQuestions(List<QuestionData> questions) {
    bloc.add(QuestionSheetQuestionsChanged(questions));
    _populateRearrangeAnswers(questions);
  }

  void _populateRearrangeAnswers(List<QuestionData> questions) {
    for (final question in questions) {
      final answer = getAnswersByQuestionId()[question.id];
      if (answer != null) {
        continue;
      }
      // Pre-populate answers for Rearrange questions.
      // If the initial order of the options is already correct,
      // the user doesn't need to make any changes. In such cases,
      // we pre-set the answer to allow the user to submit without rearranging.
      if (question is RearrangeQuestionData) {
        updateAnswer(question.id, UserOptionListAnswer(question.options));
      }
    }
  }

  Map<String, UserAnswer> getAnswersByQuestionId() {
    return bloc.state.answersByQuestionId;
  }

  void evaluate() {
    bloc.add(const QuestionSheetEvaluated());
  }

  void validate() {
    bloc.add(const QuestionSheetValidated());
  }

  void reset() {
    bloc.add(const QuestionSheetReset());
  }

  void updateAnswer(String questionId, UserAnswer answer) {
    bloc.add(QuestionSheetAnswerChanged(questionId, answer));
  }
}
