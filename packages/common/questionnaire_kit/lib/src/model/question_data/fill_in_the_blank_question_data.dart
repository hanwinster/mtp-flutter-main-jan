import 'package:base/base.dart';
import 'package:equatable/equatable.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

class FillInTheBlankQuestionData
    extends QuestionData<UserOptionsByIndexAnswer> {
  const FillInTheBlankQuestionData({
    required super.id,
    required super.content,
    required this.parts,
    required this.answerOptions,
    super.explanation,
  });

  final List<FillInTheBlankPart> parts;
  final List<AnswerOption> answerOptions;

  @override
  List<Object?> get props => super.props..addAll([parts, answerOptions]);

  @override
  EvaluationQuestionResult evaluate(UserOptionsByIndexAnswer answer) {
    if (answer.optionsByIndex.isEmpty) {
      return EvaluationQuestionResultUnanswered(questionId: id);
    }

    final correctAnswersByIndex = <int, AnswerOption>{};
    for (final (index, part) in parts.indexed) {
      if (part is BlankPart) {
        correctAnswersByIndex[index] = part.correctAnswer;
      }
    }

    if (answer.optionsByIndex.length != correctAnswersByIndex.length) {
      return EvaluationQuestionResultUnanswered(questionId: id);
    }

    final optionResultsByOptionId = <String, bool>{};
    for (final entry in answer.optionsByIndex.entries) {
      final correctAnswer = correctAnswersByIndex[entry.key];
      final selectedAnswer = entry.value;

      if (correctAnswer != null && selectedAnswer.id == correctAnswer.id) {
        optionResultsByOptionId[entry.value.id] = true;
      } else {
        optionResultsByOptionId[entry.value.id] = false;
      }
    }

    final isCorrect =
        optionResultsByOptionId.values.every((element) => element);
    return EvaluationQuestionResultOptions(
      questionId: id,
      isCorrect: isCorrect,
      explanation: explanation,
      optionResultsByOptionId: optionResultsByOptionId,
    );
  }
}

sealed class FillInTheBlankPart extends Equatable {
  const FillInTheBlankPart._();

  const factory FillInTheBlankPart.sentence(String sentence) = SentencePart;

  factory FillInTheBlankPart.blank(AnswerOption correctAnswer) {
    return BlankPart(correctAnswer: correctAnswer);
  }
}

class SentencePart extends FillInTheBlankPart {
  final String sentence;

  const SentencePart(this.sentence) : super._();

  @override
  List<Object> get props => [sentence];
}

class BlankPart extends FillInTheBlankPart {
  final AnswerOption correctAnswer;

  const BlankPart({required this.correctAnswer}) : super._();

  @override
  List<Object?> get props => [correctAnswer];
}
