import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/assessment/bloc/assessment_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class CorrectAnswersSection extends StatelessWidget {
  const CorrectAnswersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) =>
          previous.questionsUiState != current.questionsUiState ||
          previous.showCorrectAnswers != current.showCorrectAnswers,
      builder: (context, state) {
        if (!state.showCorrectAnswers) {
          return const SizedBox.shrink();
        }

        return state.questionsUiState.toView(
          context,
          successViewBuilder: (questions) {
            return Padding(
              padding: const EdgeInsets.only(
                top: Grid.two,
                bottom: Grid.two,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.courseAssessmentLabelCorrectAnswers,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.error,
                    ),
                  ),
                  for (final (index, question) in questions.indexed)
                    ListTile(
                      title: MtpHtml(
                        '${(index + 1).format(context.locale)}) ${parseTextFromHtml(question.question)}',
                        textStyle: context.textTheme.bodyMedium,
                      ),
                      subtitle: MtpHtml(
                        '- ${question.correctAnswers.join(', ')}',
                        textStyle: context.textTheme.labelLarge,
                      ),
                    )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
