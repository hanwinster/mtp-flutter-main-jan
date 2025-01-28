import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';

AnswerOption _buildAnswerOption(
  BuildContext context, {
  String? id,
  required String option,
}) {
  return AnswerOption(
    id: id ?? option,
    content: TextContent(option),
  );
}

QuestionData _mapToQuestionData(
  BuildContext context,
  EvaluationQuestion question,
) {
  switch (question) {
    case EvaluationLikertQuestion():
      return SingleChoiceQuestionData(
        id: question.id,
        content: TextContent(question.question),
        options: question.levels
            .map((e) => _buildAnswerOption(context,
                id: e.level.toString(), option: e.description))
            .toList(),
      );
    case EvaluationDeviceQuestion():
      return SingleChoiceQuestionData(
        id: question.id,
        content: TextContent(question.question),
        options: question.options
            .map((e) => _buildAnswerOption(
                  context,
                  id: e.id,
                  option: e.description,
                ))
            .toList(),
      );
    case EvaluationCommentQuestion():
      return LongTextInputQuestionData(
        id: question.id,
        content: TextContent(question.question),
      );
  }
}

List<QuestionData> mapToQuestionDataList(
  BuildContext context,
  List<EvaluationQuestion> questions,
) {
  return questions.map((e) => _mapToQuestionData(context, e)).toList();
}
