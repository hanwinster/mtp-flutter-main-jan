import 'package:base/base.dart';

sealed class LearningQuizFillInTheBlankPart extends Equatable {
  const LearningQuizFillInTheBlankPart._();

  const factory LearningQuizFillInTheBlankPart.sentence(String sentence) = LearningQuizFillInTheBlankSentencePart;

  const factory LearningQuizFillInTheBlankPart.blank(
      {String? correctAnswer}) = LearningQuizFillInTheBlankBlankPart;
}

class LearningQuizFillInTheBlankSentencePart extends LearningQuizFillInTheBlankPart {
  final String sentence;

  const LearningQuizFillInTheBlankSentencePart(this.sentence) : super._();

  @override
  List<Object> get props => [sentence];
}

class LearningQuizFillInTheBlankBlankPart extends LearningQuizFillInTheBlankPart {
  final String? correctAnswer;

  const LearningQuizFillInTheBlankBlankPart({this.correctAnswer}) : super._();

  @override
  List<Object?> get props => [correctAnswer];
}