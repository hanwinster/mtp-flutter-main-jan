import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

List<QuestionData> mapQuizQuestions({
  required BuildContext context,
  required LearningQuiz quiz,
}) {
  return quiz.questions
      // Note: Assignment questions are handled separately
      .whereNot((e) => e is LearningQuizAssignmentQuestion)
      .map((e) => _mapToQuestionData(
            context: context,
            question: e,
          ))
      .toList();
}

AnswerOption _buildAnswerOption(
  BuildContext context, {
  String? id,
  required String option,
}) {
  return AnswerOption(
    id: id ?? parseTextFromHtml(option),
    content: HtmlContent(option),
  );
}

QuestionData _mapToQuestionData({
  required BuildContext context,
  required LearningQuizQuestion question,
}) {
  final explanation = parseTextFromHtml(question.explanation);
  switch (question) {
    case LearningQuizMatchingQuestion():
      {
        final pairs = question.answer.pairs;
        final prompts = pairs
            .map((e) => _buildAnswerOption(
                  context,
                  id: e.questionLabel,
                  option: e.questionText,
                ))
            .toList();
        final options = pairs
            .map((e) => _buildAnswerOption(
                  context,
                  id: e.answerLabel,
                  option: e.answerText,
                ))
            .toList();
        options.shuffle();
        final correctOptionsByPrompt = {
          for (final pair in pairs)
            _buildAnswerOption(
              context,
              id: pair.questionLabel,
              option: pair.questionText,
            ): _buildAnswerOption(
              context,
              id: pair.answerLabel,
              option: pair.answerText,
            ),
        };
        return MatchingQuestionData(
          id: question.id,
          content: HtmlContent(question.title),
          prompts: prompts,
          options: options,
          correctOptionsByPrompt: correctOptionsByPrompt,
          explanation: explanation,
        );
      }
    case LearningQuizLongQuestion():
      {
        return LongTextInputQuestionData(
          id: question.answer.id,
          content: HtmlContent(question.title),
          explanation: explanation,
        );
      }
    case LearningQuizShortQuestion():
      {
        return TextInputQuestionData(
          id: question.answer.id,
          content: HtmlContent(question.title),
          explanation: explanation,
        );
      }
    case LearningQuizMultipleChoiceQuestion():
      {
        return MultipleChoiceQuestionData(
          id: question.id,
          content: HtmlContent(question.title),
          options: question.answers
              .map((e) => _buildAnswerOption(context,
                  id: e.id, option: parseTextFromHtml(e.answerText)))
              .toList(),
          correctOptions: question.answers
              .where((e) => e.isCorrectAnswer)
              .map((e) => _buildAnswerOption(
                    context,
                    id: e.id,
                    option: e.answerText,
                  ))
              .toList(),
          explanation: explanation,
        );
      }
    case LearningQuizTrueFalseQuestion():
      {
        final correctOption = question.answer.answer;
        final trueOption = AnswerOption(
          id: 'true',
          content: TextContent(context.l10n.courseQuizLabelOptionTrue),
        );
        final falseOption = AnswerOption(
          id: 'false',
          content: TextContent(context.l10n.courseQuizLabelOptionFalse),
        );
        return SingleChoiceQuestionData(
          id: question.id,
          content: HtmlContent(question.title),
          options: [
            trueOption,
            falseOption,
          ],
          correctOption: correctOption ? trueOption : falseOption,
          explanation: parseTextFromHtml(question.explanation),
        );
      }
    case LearningQuizFillInTheBlankQuestion():
      {
        final answer = question.answer;
        return FillInTheBlankQuestionData(
          id: question.id,
          // Note: This is a workaround to avoid showing the question text twice
          content: const EmptyContent(),
          explanation: explanation,
          parts: answer.parts.map(
            (e) {
              if (e is LearningQuizFillInTheBlankSentencePart) {
                return FillInTheBlankPart.sentence(
                    parseTextFromHtml(e.sentence));
              } else if (e is LearningQuizFillInTheBlankBlankPart) {
                final correctAnswer = e.correctAnswer ?? '';
                final correctOption = AnswerOption(
                  id: correctAnswer,
                  content: TextContent(correctAnswer),
                );
                return FillInTheBlankPart.blank(correctOption);
              } else {
                throw Exception('Unsupported part type: $e');
              }
            },
          ).toList(),
          answerOptions: answer.options
              .map(
                (e) => AnswerOption(
                  id: parseTextFromHtml(e),
                  content: TextContent(parseTextFromHtml(e)),
                ),
              )
              .toList(),
        );
      }
    case LearningQuizRearrangeQuestion():
      {
        return RearrangeQuestionData(
          id: question.id,
          content: HtmlContent(question.title),
          explanation: explanation,
          options: question.answer.options
              .map(
                (e) => _buildAnswerOption(
                  context,
                  option: e,
                ),
              )
              .toList()
            ..shuffle(),
          correctOrder: question.answer.correctOrder
              .map(
                (e) => _buildAnswerOption(
                  context,
                  option: e,
                ),
              )
              .toList(),
        );
      }
    case LearningQuizAssignmentQuestion():
      throw Exception('Assignment question is handled separately');
  }
}
