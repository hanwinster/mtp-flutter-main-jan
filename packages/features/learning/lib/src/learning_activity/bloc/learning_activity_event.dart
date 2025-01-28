part of 'learning_activity_bloc.dart';

sealed class LearningActivityEvent extends Equatable {
  const LearningActivityEvent();
}

class LearningActivityFetched extends LearningActivityEvent {
  const LearningActivityFetched();

  @override
  List<Object> get props => [];
}

class LearningActivityLearnerChanged extends LearningActivityEvent {
  final UiState<CourseLearner> learnerUiState;

  const LearningActivityLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}