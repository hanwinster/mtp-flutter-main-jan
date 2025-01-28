part of 'question_sheet_bloc.dart';

class QuestionSheetState extends Equatable {
  final List<QuestionData> questions;
  final UnmodifiableMapView<String, UserAnswer> answersByQuestionId;
  final EvaluationResult? evaluationResult;

  const QuestionSheetState({
    required this.questions,
    required this.answersByQuestionId,
    this.evaluationResult,
  });

  factory QuestionSheetState.create({
    List<QuestionData>? questions,
    Map<String, UserAnswer>? answersByQuestionId,
  }) {
    return QuestionSheetState(
      questions: questions ?? [],
      answersByQuestionId: UnmodifiableMapView(answersByQuestionId ?? {}),
    );
  }

  @override
  List<Object?> get props => [questions, answersByQuestionId, evaluationResult];

  EvaluationQuestionResult? getEvaluationQuestionResult(String questionId) {
    return evaluationResult?.questionResults.firstWhereOrNull(
      (result) => result.questionId == questionId,
    );
  }

  UserAnswer? getUserAnswer(String questionId) {
    return answersByQuestionId[questionId];
  }

  QuestionSheetState copyWith({
    List<QuestionData>? questions,
    UnmodifiableMapView<String, UserAnswer>? answersByQuestionId,
    ValueGetter<EvaluationResult?>? evaluationResult,
  }) {
    return QuestionSheetState(
      questions: questions ?? this.questions,
      answersByQuestionId: answersByQuestionId ?? this.answersByQuestionId,
      evaluationResult:
          evaluationResult != null ? evaluationResult() : this.evaluationResult,
    );
  }
}
