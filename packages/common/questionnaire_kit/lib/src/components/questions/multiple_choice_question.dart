import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:questionnaire_kit/src/callbacks.dart';
import 'package:questionnaire_kit/src/utils/widget_key_builder.dart';
import 'package:ui/ui.dart';

import '../../bloc/question_sheet_bloc.dart';

class MultipleChoiceQuestion extends StatelessWidget {
  const MultipleChoiceQuestion({
    super.key,
    required this.question,
    required this.decoration,
    required this.onAnswered,
  });

  final MultipleChoiceQuestionData question;
  final QuestionSheetDecoration decoration;
  final AnswerCallback onAnswered;

  void _handleSelection(List<AnswerOption> options, bool isSelected) {
    onAnswered(question.id, UserOptionListAnswer(options));
  }

  Widget _buildOption(
      BuildContext context,
      AnswerOption option,
      List<AnswerOption> selectedOptions,
      EvaluationQuestionResult? questionResult) {
    final optionResult = questionResult?.optionResultsByOptionId[option.id];
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      key: WidgetKeyBuilder.buildCompositeKey(question.id, [option]),
      title: QuestionContentWidget(
        content: option.content,
        style: decoration.multipleChoiceQuestionStyle?.optionTextStyle,
      ),
      secondary: optionResult != null
          ? optionResult
              ? const OptionCorrectIcon()
              : const OptionIncorrectIcon()
          : null,
      activeColor: decoration.multipleChoiceQuestionStyle?.checkBoxActiveColor,
      controlAffinity: ListTileControlAffinity.leading,
      value: selectedOptions.contains(option),
      onChanged: (selected) {
        final List<AnswerOption> newList = List.from(selectedOptions);
        if (selected ?? false) {
          newList.add(option);
        } else {
          newList.remove(option);
        }
        _handleSelection(newList, selected ?? false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
      buildWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult ||
            previous.answersByQuestionId != current.answersByQuestionId;
      },
      builder: (context, state) {
        final evaluationQuestionResult =
            state.getEvaluationQuestionResult(question.id);
        final userAnswer = state.getUserAnswer(question.id);
        final selectedOptions =
            userAnswer is UserOptionListAnswer ? userAnswer.options : null;
        return Column(
          crossAxisAlignment: decoration.crossAxisAlignment,
          children: [
            QuestionContentWidget(
              content: question.content,
              style: decoration.questionTextStyle?.textStyle,
              padding: decoration.questionTextStyle?.padding,
            ),
            if (question.getHint != null) ...[
              const SizedBox(height: 8),
              HintText(
                  hintText: question.getHint!(question.correctOptions.length)),
            ],
            const SizedBox(height: 16),
            ...question.options.map(
              (option) {
                return _buildOption(
                  context,
                  option,
                  selectedOptions ?? [],
                  evaluationQuestionResult,
                );
              },
            ),
            if (evaluationQuestionResult is EvaluationQuestionResultUnanswered) ...[
              const SizedBox(height: 8),
              Text(
                decoration.requiredErrorMessage,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
            ],
            const SizedBox(height: 16),
            ExplanationText(questionId: question.id),
          ],
        );
      },
    );
  }
}
