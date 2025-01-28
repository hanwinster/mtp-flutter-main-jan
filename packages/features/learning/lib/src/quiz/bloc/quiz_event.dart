part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizFetched extends QuizEvent {
  const QuizFetched();

  @override
  List<Object> get props => [];
}

class QuizLearnerChanged extends QuizEvent {
  final UiState<CourseLearner> learnerUiState;

  const QuizLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}

class QuizAnswered extends QuizEvent {
  const QuizAnswered(this.hasAnswered);

  final bool hasAnswered;

  @override
  List<Object> get props => [hasAnswered];
}

class QuizAnswerSubmitted extends QuizEvent {
  const QuizAnswerSubmitted(this.answersByQuestionId);

  final Map<String, QuizAnswer> answersByQuestionId;

  @override
  List<Object> get props => [answersByQuestionId];
}

class QuizAssignmentSubmitted extends QuizEvent {
  const QuizAssignmentSubmitted(
    this.assignmentId,
    this.file,
  );

  final String assignmentId;
  final File file;

  @override
  List<Object> get props => [assignmentId, file];
}
