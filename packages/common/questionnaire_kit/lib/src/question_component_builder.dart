import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'callbacks.dart';

mixin QuestionComponentBuilder {
  Widget buildQuestionComponent(
    BuildContext context, {
    required QuestionData question,
    required AnswerCallback onAnswered,
    required QuestionSheetDecoration decoration,
  }) {
    switch (question) {
      case SingleChoiceQuestionData():
        return SingleChoiceQuestion(
          question: question,
          decoration: decoration,
          onAnswered: onAnswered,
        );
      case MultipleChoiceQuestionData():
        return MultipleChoiceQuestion(
          question: question,
          decoration: decoration,
          onAnswered: onAnswered,
        );
      // case DropdownQuestionData():
      //   return DropdownQuestion(
      //     question: question,
      //     decoration: decoration,
      //     onChanged: onAnswered,
      //   );
      case LongTextInputQuestionData():
        return LongTextInputQuestion(
          question: question,
          decoration: decoration,
          onAnswered: onAnswered,
        );
      case TextInputQuestionData():
        return TextInputQuestion(
          question: question,
          decoration: decoration,
          onAnswered: onAnswered,
        );
      case MatchingQuestionData():
        return MatchingQuestion(
          question: question,
          decoration: decoration,
          onAnswered: onAnswered,
        );
      case FillInTheBlankQuestionData():
        return FillInTheBlankQuestion(
          question: question,
          decoration: decoration,
          onAnswered: onAnswered,
        );
      case RearrangeQuestionData():
        return RearrangeQuestion(
          question: question,
          decoration: decoration,
          onAnswered: onAnswered,
        );
    }

    return Center(
      child: Text('Unknown question type: ${question.runtimeType}'),
    );
  }
}
