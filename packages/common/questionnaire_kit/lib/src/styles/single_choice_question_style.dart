
import 'package:flutter/widgets.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

class SingleChoiceQuestionStyle {
  const SingleChoiceQuestionStyle({
    this.optionTextStyle,
    this.radioActiveColor,
    this.optionOrientation = OptionOrientation.vertical,
  });

  final TextStyle? optionTextStyle;
  final Color? radioActiveColor;
  final OptionOrientation? optionOrientation;

}