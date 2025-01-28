import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

String _getHint(BuildContext context, int numberOfCorrectAnswers) {
  return context.l10n
      .courseAssessmentLabelCorrectAnswerCountHint(numberOfCorrectAnswers);
}

AnswerOption _buildAnswerOption(
  BuildContext context,
  String option,
) {
  return AnswerOption(
    id: option,
    content: HtmlContent(option),
  );
}

QuestionData mapToQuestionData(
  BuildContext context, {
  required AssessmentQuestion question,
}) {
  switch (question.type) {
    case AssessmentQuestionType.multipleChoice:
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
        options: question.options
            .mapIndexed((index, option) => AnswerOption(
                id: String.fromCharCode('A'.codeUnitAt(0) + index),
                content: HtmlContent(option)))
            .toList(),
        correctOptions: correctOptions,
        getHint: (numberOfCorrectAnswers) =>
            _getHint(context, numberOfCorrectAnswers),
      );
    case AssessmentQuestionType.trueFalse:
      final options = question.options
          .map((option) => _buildAnswerOption(context, option))
          .toList();
      final correctOption = question.correctAnswers.first;
      return SingleChoiceQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        options: options,
        correctOption:
            options.firstWhere((option) => option.id == correctOption),
        getHint: (numberOfCorrectAnswers) =>
            _getHint(context, numberOfCorrectAnswers),
      );
    case AssessmentQuestionType.rearrange:
      return RearrangeQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        options: question.options
            .map((option) => _buildAnswerOption(context, option))
            .toList()
          ..shuffle(),
        correctOrder: question.correctAnswers
            .map((option) => _buildAnswerOption(context, option))
            .toList(),
        getHint: (numberOfCorrectAnswers) =>
            _getHint(context, numberOfCorrectAnswers),
      );
    case AssessmentQuestionType.matching:
      final correctOptionsByPrompt = <AnswerOption, AnswerOption>{};
      // Note: question.options is actually the prompts
      // and question.correctAnswers is actually the options
      for (final (index, option) in question.options.indexed) {
        correctOptionsByPrompt[_buildAnswerOption(context, option)] =
            _buildAnswerOption(context, question.correctAnswers[index]);
      }
      return MatchingQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        prompts: question.options
            .map((option) => _buildAnswerOption(context, option))
            .toList(),
        options: question.correctAnswers
            .map((option) => _buildAnswerOption(context, option))
            .toList()
          ..shuffle(),
        correctOptionsByPrompt: correctOptionsByPrompt,
        getHint: (numberOfCorrectAnswers) =>
            _getHint(context, numberOfCorrectAnswers),
      );
    case AssessmentQuestionType.longAnswer:
      return LongTextInputQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
        getHint: (_) {
          return _getLongAnswerHint(
            context,
            question.passingOption,
            question.userAnswer,
          );
        },
      );
    case AssessmentQuestionType.unknown:
      return TextInputQuestionData(
        id: question.id,
        content: HtmlContent(question.question),
      );
  }
}

String _getLongAnswerHint(
  BuildContext context,
  AssessmentQuestionPassingOption passingOption,
  AssessmentUserAnswer? userAnswer,
) {
  switch (passingOption) {
    case AssessmentQuestionPassingOption.afterProvidingAnswer:
      if (userAnswer != null) {
        return context.l10n
            .courseAssessmentLabelPassingOptionAfterProvdingAnswerUserAnswerStatus;
      } else {
        return context
            .l10n.courseAssessmentLabelPassingOptionAfterProvdingAnswerHint;
      }
    case AssessmentQuestionPassingOption.afterSendingFeedback:
      if (userAnswer != null) {
        if (userAnswer.comment.isNotEmpty) {
          return context.l10n.courseAssessmentLabelFeedback(userAnswer.comment);
        } else {
          return context.l10n
              .courseAssessmentLabelPassingOptionAfterSendingFeedbackUserAnswerStatus;
        }
      } else {
        return context
            .l10n.courseAssessmentLabelPassingOptionAfterSendingFeedbackHint;
      }
    case AssessmentQuestionPassingOption.afterSettingPass:
      if (userAnswer != null) {
        if (userAnswer.comment.isNotEmpty) {
          return context.l10n.courseAssessmentLabelFeedback(userAnswer.comment);
        } else {
          return context.l10n
              .courseAssessmentLabelPassingOptionAfterSettingPassUserAnswerStatus;
        }
      } else {
        return context
            .l10n.courseAssessmentLabelPassingOptionAfterSettingPassHint;
      }
    case AssessmentQuestionPassingOption.unknown:
      return 'Unknown passing option';
  }
}

UserAnswer mapToUserAnswer({
  required BuildContext context,
  required AssessmentQuestion question,
  required List<String> answers,
}) {
  switch (question.type) {
    case AssessmentQuestionType.trueFalse:
      return UserOptionAnswer(
        _buildAnswerOption(
          context,
          answers.first,
        ),
      );
    case AssessmentQuestionType.multipleChoice:
      return UserOptionListAnswer(answers.map((answer) {
        int index = answer.codeUnitAt(0) - 'A'.codeUnitAt(0);
        return AnswerOption(
          id: String.fromCharCode('A'.codeUnitAt(0) + index),
          content: HtmlContent(question.options[index]),
        );
      }).toList());
    case AssessmentQuestionType.rearrange:
      return UserOptionListAnswer(answers.map((answer) {
        return AnswerOption(
          id: parseTextFromHtml(answer),
          content: HtmlContent(answer),
        );
      }).toList());
    case AssessmentQuestionType.matching:
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
    case AssessmentQuestionType.longAnswer:
      return UserTextAnswer(answers.first);
    case AssessmentQuestionType.unknown:
      throw Exception('Unsupported question type: ${question.type}');
  }
}
