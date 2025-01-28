import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

import '../../bloc/question_sheet_bloc.dart';
import '../../callbacks.dart';
import '../../utils/widget_key_builder.dart';

class TextInputQuestion extends StatefulWidget {
  const TextInputQuestion({
    super.key,
    required this.question,
    required this.decoration,
    required this.onAnswered,
  });

  final TextInputQuestionData question;
  final QuestionSheetDecoration decoration;
  final AnswerCallback onAnswered;

  @override
  State<TextInputQuestion> createState() => _TextInputQuestionState();
}

class _TextInputQuestionState extends State<TextInputQuestion> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.decoration.crossAxisAlignment,
      children: [
        QuestionContentWidget(
          content: widget.question.content,
          style: widget.decoration.questionTextStyle?.textStyle,
          padding: widget.decoration.questionTextStyle?.padding,
        ),
        const SizedBox(height: 8),
        BlocListener<QuestionSheetBloc, QuestionSheetState>(
          listenWhen: (previous, current) {
            return previous.answersByQuestionId != current.answersByQuestionId;
          },
          listener: (context, state) {
            final userAnswer = state.answersByQuestionId[widget.question.id];
            textController.text = userAnswer is UserTextAnswer ? userAnswer.text : '';
          },
          child: BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
            buildWhen: (previous, current) {
              return previous.evaluationResult != current.evaluationResult;
            },
            builder: (context, state) {
              final result = state.getEvaluationQuestionResult(widget.question.id);
              return TextField(
                key: WidgetKeyBuilder.buildKey(widget.question.id),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: widget.decoration.textInputHint,
                  error: result is EvaluationQuestionResultUnanswered
                      ? Text(widget.decoration.requiredErrorMessage)
                      : null,
                ),
                controller: textController,
                onChanged: (value) {
                  widget.onAnswered(widget.question.id, UserTextAnswer(value));
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        ExplanationText(questionId: widget.question.id),
      ],
    );
  }
}
