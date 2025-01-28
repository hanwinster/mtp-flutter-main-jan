import 'package:base/base.dart';

class LearningQuizMultipleChoiceAnswer extends Equatable {
  final String id;
  final String answerLabel;
  final String answerText;
  final bool isCorrectAnswer;

  const LearningQuizMultipleChoiceAnswer({
    required this.id,
    required this.answerLabel,
    required this.answerText,
    required this.isCorrectAnswer,
  });

  @override
  List<Object> get props => [
        id,
        answerLabel,
        answerText,
        isCorrectAnswer,
      ];
}
