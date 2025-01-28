import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';
import 'components.dart';

class EvaluationQuestionSheet extends StatelessWidget {
  const EvaluationQuestionSheet({
    super.key,
    required this.questionSheetController,
  });

  final QuestionSheetController questionSheetController;

  @override
  Widget build(BuildContext context) {
    return QuestionSheet(
      controller: questionSheetController,
      submitButton: EvaluationSubmitButton(
        onPressed: () {
          final answers = questionSheetController.getAnswersByQuestionId();
          logger.d('Evaluation answers: $answers');
          context
              .read<EvaluationBloc>()
              .add(EvaluationAnswerSubmitted(answers));
        },
      ),
      withScaffold: false,
      decoration: QuestionSheetDecoration(
        questionTextStyle: QuestionTextStyle(
          textStyle: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        singleChoiceQuestionStyle: SingleChoiceQuestionStyle(
          optionTextStyle: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface,
          ),
          radioActiveColor: context.colorScheme.primary,
        ),
        textInputHint: context.l10n.courseLabelQuestionTextInputHint,
      ),
    );
  }
}
