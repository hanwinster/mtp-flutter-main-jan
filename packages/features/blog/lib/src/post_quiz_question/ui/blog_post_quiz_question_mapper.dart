import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

AnswerOption _buildAnswerOption(
  BuildContext context, {
  String? id,
  required String option,
}) {
  return AnswerOption(
    id: id ?? option,
    content: HtmlContent(option),
  );
}

String _localizeTrueFalseOption(BuildContext context, String option) {
  switch (option.toLowerCase()) {
    case 'true':
      return context.l10n.blogPostQuizLabelTrueFalseOptionTrue;
    case 'false':
      return context.l10n.blogPostQuizLabelTrueFalseOptionFalse;
    case 'none':
      return context.l10n.blogPostQuizLabelTrueFalseOptionNone;
    default:
      return option;
  }
}

QuestionData mapToQuestionData(
  BuildContext context,
  BlogPostQuizQuestion question,
) {
  switch (question.type) {
    case BlogPostQuizQuestionType.trueFalse:
      final correctOption = question.correctAnswers.first;
      return SingleChoiceQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        options: question.options
            .map((e) => _buildAnswerOption(
                  context,
                  id: parseTextFromHtml(e),
                  option: _localizeTrueFalseOption(context, e),
                ))
            .toList(),
        correctOption: _buildAnswerOption(context, option: correctOption),
      );
    case BlogPostQuizQuestionType.multipleChoice:
      final options = question.options
          .mapIndexed((index, option) => AnswerOption(
              id: String.fromCharCode('A'.codeUnitAt(0) + index),
              content: HtmlContent(option)))
          .toList();
      final correctOptions = question.correctAnswers
          .map((answerId) => AnswerOption(
              id: answerId,
              content: options
                  .firstWhere((option) => option.id == answerId)
                  .content))
          .toList();
      return MultipleChoiceQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        options: options,
        correctOptions: correctOptions,
      );
    case BlogPostQuizQuestionType.rearrange:
      return RearrangeQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        options: question.options
            .map(
              (e) => _buildAnswerOption(
                context,
                id: parseTextFromHtml(e),
                option: e,
              ),
            )
            .toList()
          ..shuffle(),
        correctOrder: question.correctAnswers
            .map(
              (e) => _buildAnswerOption(
                context,
                id: parseTextFromHtml(e),
                option: e,
              ),
            )
            .toList(),
      );
    case BlogPostQuizQuestionType.matching:
      final prompts = question.options
          .map((e) => _buildAnswerOption(
                context,
                id: parseTextFromHtml(e),
                option: e,
              ))
          .toList();
      final options = question.correctAnswers
          .map((e) => _buildAnswerOption(
                context,
                id: parseTextFromHtml(e),
                option: e,
              ))
          .toList();
      final correctOptionsByPrompt = {
        for (final (index, prompt) in prompts.indexed) prompt: options[index],
      };
      return MatchingQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        prompts: prompts,
        options: options..shuffle(),
        correctOptionsByPrompt: correctOptionsByPrompt,
      );
    case BlogPostQuizQuestionType.unknown:
      throw Exception('Unsupported question type: ${question.type}');
  }
}

UserAnswer mapToUserAnswer({
  required BuildContext context,
  required BlogPostQuizQuestion question,
  required List<String> answers,
}) {
  switch (question.type) {
    case BlogPostQuizQuestionType.multipleChoice:
      return UserOptionListAnswer(answers.map((answer) {
        int index = answer.codeUnitAt(0) - 'A'.codeUnitAt(0);
        return AnswerOption(
          id: String.fromCharCode('A'.codeUnitAt(0) + index),
          content: HtmlContent(question.options[index]),
        );
      }).toList());
    case BlogPostQuizQuestionType.rearrange:
      return UserOptionListAnswer(answers.map((answer) {
        return AnswerOption(
          id: parseTextFromHtml(answer),
          content: HtmlContent(answer),
        );
      }).toList());
    case BlogPostQuizQuestionType.matching:
      final optionsByPrompt = question.options.asMap().map((index, prompt) {
        final promptAnswerOption = AnswerOption(
          id: parseTextFromHtml(prompt),
          content: HtmlContent(prompt),
        );
        final userAnswerAtIndex = answers[index] ?? '';
        final userAnswerOption = AnswerOption(
            id: parseTextFromHtml(userAnswerAtIndex),
            content: HtmlContent(userAnswerAtIndex));
        return MapEntry(promptAnswerOption, userAnswerOption);
      });
      return UserOptionMapAnswer(optionsByPrompt);
    case BlogPostQuizQuestionType.trueFalse:
      return UserOptionAnswer(
        _buildAnswerOption(
          context,
          id: answers.first,
          option: _localizeTrueFalseOption(context, answers.first),
        ),
      );
    case BlogPostQuizQuestionType.unknown:
      throw Exception('Unsupported question type: ${question.type}');
  }
}
