part of 'evaluation_bloc.dart';

final class EvaluationState extends Equatable {
  const EvaluationState({
    required this.courseId,
    this.evaluationQuestionsUiState = const UiStateInitial(),
    this.answerSubmissionUiState = const UiStateInitial(),
  });

  final String courseId;
  final UiState<List<EvaluationQuestion>> evaluationQuestionsUiState;
  final UiState<String> answerSubmissionUiState;

  factory EvaluationState.create({
    required String courseId,
  }) {
    return EvaluationState(
      courseId: courseId,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        evaluationQuestionsUiState,
        answerSubmissionUiState,
      ];

  EvaluationState copyWith({
    String? courseId,
    UiState<List<EvaluationQuestion>>? evaluationQuestionsUiState,
    UiState<String>? answerSubmissionUiState,
  }) {
    return EvaluationState(
      courseId: courseId ?? this.courseId,
      evaluationQuestionsUiState:
          evaluationQuestionsUiState ?? this.evaluationQuestionsUiState,
      answerSubmissionUiState:
          answerSubmissionUiState ?? this.answerSubmissionUiState,
    );
  }
}
