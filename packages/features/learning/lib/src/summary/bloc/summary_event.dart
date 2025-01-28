part of 'summary_bloc.dart';

sealed class SummaryEvent extends Equatable {
  const SummaryEvent();
}

class SummaryFetched extends SummaryEvent {
  const SummaryFetched();

  @override
  List<Object> get props => [];
}


class SummaryLearnerChanged extends SummaryEvent {
  final UiState<CourseLearner> learnerUiState;

  const SummaryLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}