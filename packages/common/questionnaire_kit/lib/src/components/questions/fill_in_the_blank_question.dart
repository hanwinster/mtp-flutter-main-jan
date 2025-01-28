import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:questionnaire_kit/src/callbacks.dart';

import '../../bloc/question_sheet_bloc.dart';

class FillInTheBlankQuestion extends StatefulWidget {
  const FillInTheBlankQuestion({
    super.key,
    required this.question,
    required this.decoration,
    required this.onAnswered,
  });

  final FillInTheBlankQuestionData question;
  final QuestionSheetDecoration decoration;
  final AnswerCallback onAnswered;

  @override
  State<FillInTheBlankQuestion> createState() => _FillInTheBlankQuestionState();
}

class _FillInTheBlankQuestionState extends State<FillInTheBlankQuestion> {
  late List<int> filledBlankIndexes; // Track the order of filled blanks
  int _nextBlankIndex = 0; // Track the next blank to fill

  @override
  void initState() {
    super.initState();
    filledBlankIndexes = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.question.content is! EmptyContent) ...[
          QuestionContentWidget(
            content: widget.question.content,
            style: widget.decoration.questionTextStyle?.textStyle,
            padding: widget.decoration.questionTextStyle?.padding,
          ),
          const SizedBox(height: 8),
        ],
        _QuestionLine(
          parts: widget.question.parts,
          questionId: widget.question.id,
          onBlankFilled: (index, option) {
            setState(() {
              if (!filledBlankIndexes.contains(index)) {
                filledBlankIndexes.add(index);
              }
              notifyAnswerChanged(context, index, option);
            });
          },
          onAnswered: widget.onAnswered,
        ),
        _DragSourceRow(
          questionId: widget.question.id,
          optionAnswers: widget.question.answerOptions,
          onAnswerClicked: (answer) {
            setState(() {
              bool filled = false;
              while (_nextBlankIndex < widget.question.parts.length) {
                if (widget.question.parts[_nextBlankIndex] is BlankPart) {
                  notifyAnswerChanged(context, _nextBlankIndex, answer);
                  filledBlankIndexes
                      .add(_nextBlankIndex); // Track the filled blank position
                  _nextBlankIndex++;
                  filled = true;
                  break;
                }
                _nextBlankIndex++;
              }

              if (!filled) {
                // Reset index and start from the first blank again
                _nextBlankIndex = 0;
                while (_nextBlankIndex < widget.question.parts.length) {
                  if (widget.question.parts[_nextBlankIndex] is BlankPart) {
                    notifyAnswerChanged(context, _nextBlankIndex, answer);
                    filledBlankIndexes.add(
                        _nextBlankIndex); // Track the filled blank position
                    _nextBlankIndex++;
                    break;
                  }
                  _nextBlankIndex++;
                }
              }
            });
          },
        ),
        const SizedBox(height: 16),
        ExplanationText(questionId: widget.question.id),
      ],
    );
  }

  void notifyAnswerChanged(
    BuildContext context,
    int index,
    AnswerOption option,
  ) {
    final userAnswer = context
        .read<QuestionSheetBloc>()
        .state
        .getUserAnswer(widget.question.id);
    final Map<int, AnswerOption> filledOptions =
        userAnswer is UserOptionsByIndexAnswer ? userAnswer.optionsByIndex : {};
    final Map<int, AnswerOption> newAnswers = Map.from(filledOptions);
    newAnswers[index] = option;
    widget.onAnswered(widget.question.id, UserOptionsByIndexAnswer(newAnswers));
  }
}

class _QuestionLine extends StatefulWidget {
  final String questionId;
  final List<FillInTheBlankPart> parts;
  final Function(int, AnswerOption) onBlankFilled;
  final AnswerCallback onAnswered;

  const _QuestionLine({
    required this.parts,
    required this.questionId,
    required this.onBlankFilled,
    required this.onAnswered,
  });

  @override
  State<_QuestionLine> createState() => _QuestionLineState();
}

class _QuestionLineState extends State<_QuestionLine> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
      buildWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult ||
            previous.answersByQuestionId != current.answersByQuestionId;
      },
      builder: (context, state) {
        final evaluationQuestionResult =
            state.getEvaluationQuestionResult(widget.questionId);
        final userAnswer = state.getUserAnswer(widget.questionId);
        final Map<int, AnswerOption> filledOptions =
            userAnswer is UserOptionsByIndexAnswer
                ? userAnswer.optionsByIndex
                : {};

        List<InlineSpan> children = [];
        widget.parts.asMap().forEach((index, part) {
          if (part is SentencePart) {
            children.add(TextSpan(text: part.sentence));
          } else if (part is BlankPart) {
            children.add(
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: _buildDragTargetBlank(
                  index,
                  filledOptions,
                  evaluationQuestionResult,
                ),
              ),
            );
          }
        });

        return RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Colors.black),
            children: children,
          ),
        );
      },
    );
  }

  Widget _buildDragTargetBlank(
    int index,
    Map<int, AnswerOption> userAnswersByIndex,
    EvaluationQuestionResult? evaluationQuestionResult,
  ) {
    bool? optionResult;
    final filledOption = userAnswersByIndex[index];
    if (filledOption != null) {
      optionResult =
          evaluationQuestionResult?.optionResultsByOptionId[filledOption.id];
    }

    final colorScheme = Theme.of(context).colorScheme;
    return DragTarget<AnswerOption>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: userAnswersByIndex.containsKey(index)
                    ? Theme.of(context).colorScheme.primary
                    : candidateData.isNotEmpty
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                width: 2.0,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  userAnswersByIndex[index]?.content.value ?? "___?____",
                  style: TextStyle(
                    fontSize: 16,
                    color: userAnswersByIndex.containsKey(index)
                        ? colorScheme.onSurface
                        : colorScheme.onSurface.withOpacity(0.56),
                  ),
                ),
              ),
              if (optionResult != null) ...[
                const SizedBox(width: 8.0),
                optionResult
                    ? const OptionCorrectIcon()
                    : const OptionIncorrectIcon(),
              ],
            ],
          ),
        );
      },
      onWillAcceptWithDetails: (details) {
        return true;
      },
      onAcceptWithDetails: (details) {
        widget.onBlankFilled(index, details.data);
      },
    );
  }
}

class _DragSourceRow extends StatelessWidget {
  const _DragSourceRow({
    required this.questionId,
    required this.optionAnswers,
    required this.onAnswerClicked,
  });

  final String questionId;
  final List<AnswerOption> optionAnswers;
  final Function(AnswerOption) onAnswerClicked;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
      buildWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult ||
            previous.answersByQuestionId != current.answersByQuestionId;
      },
      builder: (context, state) {
        return Wrap(
          spacing: 4.0,
          runSpacing: 2.0,
          children: optionAnswers.map((answer) {
            return Draggable<AnswerOption>(
              data: answer,
              feedback: Material(
                color: Colors.transparent,
                child: Chip(
                  label: Text(answer.content.value,
                      style: TextStyle(color: colorScheme.primary)),
                  backgroundColor: colorScheme.surface,
                ),
              ),
              childWhenDragging: Chip(
                label: Text(answer.content.value),
                backgroundColor: Colors.grey,
              ),
              child: GestureDetector(
                onTap: () => onAnswerClicked(answer),
                child: Chip(
                  label: Text(answer.content.value),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
