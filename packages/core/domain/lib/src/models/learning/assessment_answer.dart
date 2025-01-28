import 'package:base/base.dart';

sealed class AssessmentAnswer extends Equatable {
  const AssessmentAnswer();
}

class AssessmentStringAnswer extends AssessmentAnswer {
  const AssessmentStringAnswer({
    required this.answer,
  });

  final String answer;

  @override
  List<Object> get props => [answer];
}

class AssessmentStringListAnswer extends AssessmentAnswer {
  const AssessmentStringListAnswer({
    required this.answers,
  });

  final List<String> answers;

  @override
  List<Object> get props => [answers];
}

class AssessmentStringMapAnswer extends AssessmentAnswer {
  const AssessmentStringMapAnswer({
    required this.answers,
  });

  final Map<String, String> answers;

  @override
  List<Object> get props => [answers];
}