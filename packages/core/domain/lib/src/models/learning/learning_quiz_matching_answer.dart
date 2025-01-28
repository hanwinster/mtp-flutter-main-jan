import 'package:base/base.dart';

class LearningQuizMatchingAnswer extends Equatable {
  final String id;
  final List<LearningQuizMatchingPair> pairs;

  const LearningQuizMatchingAnswer({
    required this.id,
    required this.pairs,
  });

  @override
  List<Object> get props => [id, pairs];
}

class LearningQuizMatchingPair extends Equatable {
  final String questionLabel;
  final String questionText;
  final String answerLabel;
  final String answerText;

  const LearningQuizMatchingPair({
    required this.questionLabel,
    required this.questionText,
    required this.answerLabel,
    required this.answerText,
  });

  @override
  List<Object?> get props => [
        questionLabel,
        questionText,
        answerLabel,
        answerText,
      ];
}
