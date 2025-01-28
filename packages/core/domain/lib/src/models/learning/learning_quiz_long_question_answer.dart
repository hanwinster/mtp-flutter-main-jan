import 'package:base/base.dart';

class LearningQuizLongQuestionAnswer extends Equatable {
  final String id;
  final String answer;
  final String userAnswer;

  const LearningQuizLongQuestionAnswer({
    required this.id,
    required this.answer,
    required this.userAnswer,
  });

  @override
  List<Object> get props => [id, answer, userAnswer];
}
