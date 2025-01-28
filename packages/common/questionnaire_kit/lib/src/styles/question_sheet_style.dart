
import 'package:flutter/widgets.dart';
import 'styles.dart';

class QuestionSheetDecoration {

  const QuestionSheetDecoration({
    this.questionTextStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.contentPadding = const EdgeInsets.all(16),
    this.separator = const SizedBox(height: 16),
    this.longTextMaxLines = 5,
    this.matchingPromptHint = 'Select match',
    this.textInputHint = 'Type your answer here',
    this.optionInputHint = 'Select an option',
    this.requiredErrorMessage = 'Required!',
    this.hintTextStyle,
    this.singleChoiceQuestionStyle,
    this.matchingQuestionStyle,
    this.multipleChoiceQuestionStyle,
  });

  final Widget separator;
  final QuestionTextStyle? questionTextStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry contentPadding;
  final int longTextMaxLines;
  final String textInputHint;
  final String matchingPromptHint;
  final String optionInputHint;
  final String requiredErrorMessage;
  final TextStyle? hintTextStyle;

  final SingleChoiceQuestionStyle? singleChoiceQuestionStyle;
  final MatchingQuestionStyle? matchingQuestionStyle;
  final MultipleChoiceQuestionStyle? multipleChoiceQuestionStyle;


}