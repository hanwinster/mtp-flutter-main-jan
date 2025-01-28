part of 'evaluation_bloc.dart';

sealed class EvaluationEvent extends Equatable {
  const EvaluationEvent();
}

class EvaluationQuestionsFetched extends EvaluationEvent {
  const EvaluationQuestionsFetched();

  @override
  List<Object> get props => [];
}

class EvaluationAnswerSubmitted extends EvaluationEvent {
  const EvaluationAnswerSubmitted(this.answers);

  final Map<String, UserAnswer> answers;

  @override
  List<Object> get props => [answers];
}
