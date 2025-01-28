part of 'live_session_bloc.dart';

sealed class LiveSessionEvent extends Equatable {
  const LiveSessionEvent();
}

class LiveSessionFetched extends LiveSessionEvent {
  const LiveSessionFetched();

  @override
  List<Object> get props => [];
}

class LiveSessionLearnerChanged extends LiveSessionEvent {
  final UiState<CourseLearner> learnerUiState;

  const LiveSessionLearnerChanged(this.learnerUiState);

  @override
  List<Object> get props => [learnerUiState];
}