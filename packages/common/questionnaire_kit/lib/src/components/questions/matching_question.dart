import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:questionnaire_kit/src/callbacks.dart';
import 'package:ui/ui.dart';

import '../../bloc/question_sheet_bloc.dart';

class MatchingQuestion extends StatefulWidget {
  const MatchingQuestion({
    super.key,
    required this.question,
    required this.decoration,
    required this.onAnswered,
  });

  final MatchingQuestionData question;
  final QuestionSheetDecoration decoration;
  final AnswerCallback onAnswered;

  @override
  State<MatchingQuestion> createState() => _MatchingQuestionState();
}

class _MatchingQuestionState extends State<MatchingQuestion> {
  final List<TextEditingController> _textEditingControllers = [];

  @override
  void initState() {
    for (var i = 0; i < widget.question.prompts.length; i++) {
      _textEditingControllers.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    for (final controller in _textEditingControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
      buildWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult ||
            previous.answersByQuestionId != current.answersByQuestionId;
      },
      builder: (context, state) {
        final questionResult =
            state.getEvaluationQuestionResult(widget.question.id);
        final userAnswer = state.getUserAnswer(widget.question.id);
        final Map<AnswerOption, AnswerOption> matchedOptionsByPrompt =
            userAnswer is UserOptionMapAnswer ? userAnswer.optionsByPrompt : {};



        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionContentWidget(
              content: widget.question.content,
              style: widget.decoration.questionTextStyle?.textStyle,
              padding: widget.decoration.questionTextStyle?.padding,
            ),
            const SizedBox(height: Grid.two),
            ...widget.question.prompts.mapIndexed(
              (index, prompt) {
                final selectedOption = matchedOptionsByPrompt[prompt];
                if (selectedOption != null) {
                  _textEditingControllers[index].text = selectedOption.content.value;
                } else {
                  _textEditingControllers[index].clear();
                }

                bool? isCorrect;
                if (questionResult != null) {
                  isCorrect = questionResult
                      .optionResultsByOptionId[selectedOption?.id];
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index > 0) const SizedBox(height: Grid.two),
                    QuestionContentWidget(
                      content: prompt.content,
                      style: widget
                          .decoration.matchingQuestionStyle?.promptTextStyle,
                    ),
                    const SizedBox(height: Grid.one),
                    Row(
                      children: [
                        Expanded(
                          child: MtpOutlineTextField(
                            controller: _textEditingControllers[index],
                            readOnly: true,
                            hintText: widget.decoration.matchingPromptHint,
                            suffixIcon: Icon(
                              Icons.arrow_drop_down,
                              color: context.colorScheme.primary,
                            ),
                            onTap: () async {
                              final result = await _showOptionsDialog(
                                context,
                                title:
                                    widget.decoration.matchingPromptHint ?? '',
                                options: widget.question.options,
                              );
                              if (result != null) {
                                final newMap =
                                    Map<AnswerOption, AnswerOption>.from(
                                  matchedOptionsByPrompt,
                                );
                                newMap[prompt] = result;
                                widget.onAnswered(
                                  widget.question.id,
                                  UserOptionMapAnswer(<AnswerOption,
                                      AnswerOption>{
                                    ...newMap,
                                  }),
                                );
                              }
                            },
                          ),
                        ),
                        if (isCorrect != null) ...[
                          if (isCorrect)
                            const OptionCorrectIcon()
                          else
                            const OptionIncorrectIcon()
                        ],
                      ],
                    ),
                  ],
                );
              },
            ),
            if (questionResult is EvaluationQuestionResultUnanswered) ...[
              const SizedBox(height: 8),
              Text(
                widget.decoration.requiredErrorMessage,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
            ],
            const SizedBox(height: 16),
            ExplanationText(questionId: widget.question.id),
          ],
        );
      },
    );
  }

  Future<AnswerOption?> _showOptionsDialog(
    BuildContext context, {
    required String title,
    required List<AnswerOption> options,
  }) async {
    final result = await showModalBottomSheet<AnswerOption?>(
      context: context,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Grid.one),
          topRight: Radius.circular(Grid.one),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return OptionsDialogContent(
          title: title,
          options: options,
        );
      },
    );
    return result;
  }
}

class OptionsDialogContent extends StatefulWidget {
  const OptionsDialogContent({
    super.key,
    required this.title,
    required this.options,
  });

  final String title;
  final List<AnswerOption> options;

  @override
  State<OptionsDialogContent> createState() => _OptionsDialogContentState();
}

class _OptionsDialogContentState extends State<OptionsDialogContent> {
  AnswerOption? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Grid.two,
              ),
              child: Text(
                widget.title,
                style: context.textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: Grid.two),
          ],
          for (final option in widget.options)
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: QuestionContentWidget(content: option.content),
              value: option,
              groupValue: selectedOption,
              onChanged: (value) {
                if (value == selectedOption) {
                  return;
                }
                setState(() {
                  selectedOption = value as AnswerOption;
                });
                Navigator.of(context).pop(value);
              },
            ),
        ],
      ),
    );
  }
}
