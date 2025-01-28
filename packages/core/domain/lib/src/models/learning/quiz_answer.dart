import 'package:base/base.dart';

sealed class QuizAnswer extends Equatable {
  const QuizAnswer();
}

class QuizStringAnswer extends QuizAnswer {
  const QuizStringAnswer({
    required this.answer,
  });

  final String answer;

  @override
  List<Object> get props => [answer];
}

class QuizStringListAnswer extends QuizAnswer {
  const QuizStringListAnswer({
    required this.answers,
  });

  final List<String> answers;

  @override
  List<Object> get props => [answers];
}

class QuizStringMapAnswer extends QuizAnswer {
  const QuizStringMapAnswer({
    required this.answers,
  });

  final Map<String, String> answers;

  @override
  List<Object> get props => [answers];
}