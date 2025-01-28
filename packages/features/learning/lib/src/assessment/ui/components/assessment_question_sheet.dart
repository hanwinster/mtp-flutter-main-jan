import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import 'assessment_buttons.dart';

class AssessmentQuestionSheet extends StatelessWidget {
  const AssessmentQuestionSheet({
    super.key,
    required this.questionSheetController,
  });

  final QuestionSheetController questionSheetController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionSheet(
          controller: questionSheetController,
          withScaffold: false,
          submitButton: AssessmentSaveButton(
            onPressed: () {
              final answers = questionSheetController.getAnswersByQuestionId();
              logger.d('Answers: $answers');
              context.read<AssessmentBloc>().add(AssessmentSaved(answers));
            },
          ),
          decoration: QuestionSheetDecoration(
            contentPadding: EdgeInsets.zero,
            questionTextStyle: QuestionTextStyle(
              textStyle: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
            textInputHint: context.l10n.courseLabelQuestionTextInputHint,
            matchingPromptHint: context.l10n.courseLabelQuestionMatchingHint,
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
        const SizedBox(height: Grid.one),
        AssessmentSubmitButton(
          onPressed: () {
            context.read<AssessmentBloc>().add(const AssessmentSubmitted());
          },
        ),
      ],
    );
  }
}
