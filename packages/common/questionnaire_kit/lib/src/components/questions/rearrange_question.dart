import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../bloc/question_sheet_bloc.dart';
import '../../callbacks.dart';

class RearrangeQuestion extends StatefulWidget {
  final RearrangeQuestionData question;
  final QuestionSheetDecoration decoration;
  final AnswerCallback onAnswered;

  const RearrangeQuestion({
    super.key,
    required this.question,
    required this.decoration,
    required this.onAnswered,
  });

  @override
  State<RearrangeQuestion> createState() => _RearrangeQuestionState();
}

class _RearrangeQuestionState extends State<RearrangeQuestion> {
  bool hasRearranged = true;

  Widget _buildGuideText() {
    return Text(
      context.l10n.courseLabelQuestionRearrangeGuide,
      style: context.textTheme.labelSmall?.copyWith(
        color: context.colorScheme.onSurface.withOpacity(0.87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionContentWidget(
          content: widget.question.content,
          style: widget.decoration.questionTextStyle?.textStyle,
          padding: widget.decoration.questionTextStyle?.padding,
        ),
        const SizedBox(height: 8),
        _buildGuideText(),
        _buildReorderableList(),
        ExplanationText(
          padding: const EdgeInsets.only(top: 16),
          questionId: widget.question.id,
        ),
      ],
    );
  }

  Widget _buildReorderableList() {
    return BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
      buildWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult ||
            previous.answersByQuestionId != current.answersByQuestionId;
      },
      builder: (context, state) {
        final evaluationQuestionResult =
            state.getEvaluationQuestionResult(widget.question.id);
        final userAnswer = state.getUserAnswer(widget.question.id);
        final List<AnswerOption> currentOrder =
            userAnswer is UserOptionListAnswer
                ? userAnswer.options
                : widget.question.options;
        return ReorderableListView(
          shrinkWrap: true,
          buildDefaultDragHandles: true,
          physics: const NeverScrollableScrollPhysics(),
          // Ensure it doesn't scroll independently
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final newOrder = List<AnswerOption>.from(currentOrder);
            final item = newOrder.removeAt(oldIndex);
            newOrder.insert(newIndex, item);

            hasRearranged = true;

            widget.onAnswered(
                widget.question.id, UserOptionListAnswer(newOrder));
          },
          children: [
            for (int index = 0; index < currentOrder.length; index++)
              ListTile(
                contentPadding: EdgeInsets.zero,
                key: ValueKey('${currentOrder[index].id}~$index'),
                leading: Container(
                  width: 40.0,
                  // Size of the circle
                  height: 40.0,
                  // Size of the circle
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: hasRearranged
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                      width: 2.0, // Border width
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    hasRearranged ? _formatNumber(index + 1) : '?',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: hasRearranged
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: QuestionContentWidget(
                        content: currentOrder[index].content,
                      ),
                    ),
                    if (evaluationQuestionResult != null)
                      if (evaluationQuestionResult.optionResultsByOptionId[
                              currentOrder[index].id] !=
                          null) ...[
                        const SizedBox(width: 8),
                        evaluationQuestionResult.optionResultsByOptionId[
                                currentOrder[index].id]!
                            ? const OptionCorrectIcon()
                            : const OptionIncorrectIcon(),
                      ],
                  ],
                ),
                trailing: const Icon(Icons.drag_handle),
              ),
          ],
        );
      },
    );
  }

  String _formatNumber(int number) {
    final format =
        NumberFormat.decimalPattern(); // Use the current locale for formatting
    return format.format(number);
  }
}
