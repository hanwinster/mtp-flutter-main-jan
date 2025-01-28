import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/quiz/ui/quiz_answer_mapper.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import 'components.dart';

class QuizQuestionSheet extends StatelessWidget {
  const QuizQuestionSheet({
    super.key,
    required this.quiz,
    required this.controller,
  });

  final LearningQuiz quiz;
  final QuestionSheetController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MtpHtmlPlainText(
          quiz.title,
          textStyle: context.textTheme.titleMedium,
        ),
        const SizedBox(height: Grid.two),
        QuestionSheet(
          controller: controller,
          onEvaluationCompleted: (result) {
            if (!result.containsUnanswered) {
              context.read<QuizBloc>().add(const QuizAnswered(true));
              logger.d('!!!Validation result: $result');
            } else {
              showSnackBar(
                  context, context.l10n.courseLableQuestionAllRequiredError);
            }
          },
          submitButton: SubmitButton(
            isEvaluableQuiz: quiz.type.isEvaluable,
            onSubmitAnswerPressed: () {
              final answers = controller.getAnswersByQuestionId();
              logger.d('!!!Answers: $answers');
              context
                  .read<QuizBloc>()
                  .add(QuizAnswerSubmitted(mapQuizAnswers(answers)));
            },
            onCheckAnswerPressed: () {
              controller.evaluate();
            },
            onRetakeQuizPressed: () {
              controller.reset();
              context.read<QuizBloc>().add(const QuizAnswered(false));
            },
          ),
          withScaffold: false,
          decoration: QuestionSheetDecoration(
            contentPadding: EdgeInsets.zero,
            questionTextStyle: QuestionTextStyle(
              textStyle: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            textInputHint: context.l10n.courseLabelQuestionTextInputHint,
            matchingPromptHint: context.l10n.courseLabelQuestionMatchingHint,
            requiredErrorMessage: context.l10n.courseLableQuestionRequiredError,
            hintTextStyle: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            singleChoiceQuestionStyle: SingleChoiceQuestionStyle(
              optionTextStyle: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
              ),
              radioActiveColor: context.colorScheme.primary,
            ),
            matchingQuestionStyle: MatchingQuestionStyle(
              promptTextStyle: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
              optionTextStyle: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            multipleChoiceQuestionStyle: MultipleChoiceQuestionStyle(
              optionTextStyle: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
              ),
              checkBoxActiveColor: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
