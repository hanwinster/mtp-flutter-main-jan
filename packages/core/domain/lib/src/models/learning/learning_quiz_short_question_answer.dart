import 'package:base/base.dart';

class LearningQuizShortQuestionAnswer extends Equatable {
  final String id;
  final String answer;
  final String userAnswer;

  const LearningQuizShortQuestionAnswer({
    required this.id,
    required this.answer,
    required this.userAnswer,
  });

  @override
  List<Object> get props => [id, answer, userAnswer];
}
