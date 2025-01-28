import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:questionnaire_kit/src/callbacks.dart';
import 'package:ui/ui.dart';

import '../../bloc/question_sheet_bloc.dart';
import '../../utils/widget_key_builder.dart';

class SingleChoiceQuestion extends StatelessWidget {
  const SingleChoiceQuestion({
    super.key,
    required this.question,
    required this.decoration,
    required this.onAnswered,
  });

  final SingleChoiceQuestionData question;
  final QuestionSheetDecoration decoration;
  final AnswerCallback onAnswered;

  void _handleSelection(AnswerOption? option) {
    if (option != null) {
      onAnswered(question.id, UserOptionAnswer(option));
    }
  }

  Widget _buildOption(AnswerOption option, AnswerOption? selectedOption,
      EvaluationQuestionResult? evaluationResult) {
    final optionResult = evaluationResult?.optionResultsByOptionId[option.id];
    return Row(
      children: [
        Radio<AnswerOption>(
          key: WidgetKeyBuilder.buildKey(question.id, option.id),
          value: option,
          groupValue: selectedOption,
          onChanged: _handleSelection,
          activeColor: decoration.singleChoiceQuestionStyle?.radioActiveColor,
        ),
        Expanded(
          child: QuestionContentWidget(
            content: option.content,
            style: decoration.singleChoiceQuestionStyle?.optionTextStyle,
          ),
        ),
        if (optionResult != null)
          optionResult
              ? const OptionCorrectIcon()
              : const OptionIncorrectIcon(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation =
        decoration.singleChoiceQuestionStyle?.optionOrientation ??
            OptionOrientation.vertical;
    return BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
      buildWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult ||
            previous.answersByQuestionId != current.answersByQuestionId;
      },
      builder: (context, state) {
        final result = state.getEvaluationQuestionResult(question.id);
        final userAnswer = state.getUserAnswer(question.id);
        final selectedOption =
            userAnswer is UserOptionAnswer ? userAnswer.option : null;
        return Column(
          crossAxisAlignment: decoration.crossAxisAlignment,
          children: [
            QuestionContentWidget(
              content: question.content,
              style: decoration.questionTextStyle?.textStyle,
              padding: decoration.questionTextStyle?.padding,
            ),
            const SizedBox(height: 8),
            if (orientation == OptionOrientation.vertical)
              ...question.options.map(
                (option) {
                  return InkWell(
                    onTap: () => _handleSelection(option),
                    child: _buildOption(
                      option,
                      selectedOption,
                      result,
                    ),
                  );
                },
              ),
            if (orientation == OptionOrientation.horizontal)
              Row(
                children: [
                  for (final option in question.options)
                    Expanded(
                      child: InkWell(
                        onTap: () => _handleSelection(option),
                        child: _buildOption(
                          option,
                          selectedOption,
                          result,
                        ),
                      ),
                    ),
                ],
              ),
            if (result is EvaluationQuestionResultUnanswered) ...[
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
