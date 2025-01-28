import 'package:base/base.dart';

import 'learning_quiz_fill_in_the_blank_part.dart';

class LearningQuizFillInTheBlankAnswer extends Equatable {
  final String id;
  final List<String> correctAnswers;
  final List<String> optionalKeywords;
  final List<LearningQuizFillInTheBlankPart> parts;

  const LearningQuizFillInTheBlankAnswer({
    required this.id,
    required this.correctAnswers,
    required this.optionalKeywords,
    required this.parts,
  });

  List<String> get options =>
      (correctAnswers + optionalKeywords).toSet().toList()..shuffle();

  @override
  List<Object> get props => [id, correctAnswers, optionalKeywords, parts];
}
