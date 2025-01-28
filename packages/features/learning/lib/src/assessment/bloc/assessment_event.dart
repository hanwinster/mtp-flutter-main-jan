part of 'assessment_bloc.dart';

sealed class AssessmentEvent extends Equatable {
  const AssessmentEvent();
}

class AssessmentQuestionFetched extends AssessmentEvent {
  const AssessmentQuestionFetched();

  @override
  List<Object> get props => [];
}

class AssessmentQuestionsFetched extends AssessmentEvent {
  const AssessmentQuestionsFetched();

  @override
  List<Object> get props => [];
}

class AssessmentLearnerChanged extends AssessmentEvent {
  final UiState<CourseLearner> learnerUiState;

  const AssessmentLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}

class AssessmentSaved extends AssessmentEvent {
  const AssessmentSaved(this.answersByQuestionId);
  final Map<String, UserAnswer> answersByQuestionId;

  @override
  List<Object> get props => [answersByQuestionId];
}


class AssessmentSubmitted extends AssessmentEvent {
  const AssessmentSubmitted();

  @override
  List<Object> get props => [];
}

class AssessmentCorrectAnswersShown extends AssessmentEvent {
  const AssessmentCorrectAnswersShown();

  @override
  List<Object> get props => [];
}