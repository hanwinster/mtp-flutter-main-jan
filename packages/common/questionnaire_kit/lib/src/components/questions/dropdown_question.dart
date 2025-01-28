import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:questionnaire_kit/src/utils/widget_key_builder.dart';

class DropdownQuestion extends StatefulWidget {
  const DropdownQuestion({
    super.key,
    required this.question,
    required this.decoration,
    this.onChanged,
  });

  final DropdownQuestionData question;
  final QuestionSheetDecoration decoration;
  final Function(String questionId, dynamic value)? onChanged;

  @override
  State<DropdownQuestion> createState() => _DropdownQuestionState();
}

class _DropdownQuestionState extends State<DropdownQuestion> {
  AnswerOption? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.decoration.crossAxisAlignment,
      children: [
        QuestionContentWidget(
          content: widget.question.content,
          style: widget.decoration.questionTextStyle?.textStyle,

        ),
        DropdownButton<AnswerOption>(
          key: WidgetKeyBuilder.buildKey(
              widget.question.id, widget.question.content.value),
          value: _selectedOption,
          hint: Text(widget.decoration.optionInputHint),
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(widget.question.id, value);
            }
          },
          items: widget.question.options
              .map<DropdownMenuItem<AnswerOption>>((AnswerOption option) {
            return DropdownMenuItem<AnswerOption>(
              key: WidgetKeyBuilder.buildKey(widget.question.id, option.id),
              value: option,
              child: QuestionContentWidget(content: option.content),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        ExplanationText(questionId: widget.question.id),
      ],
    );
  }
}
