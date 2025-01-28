import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/question_sheet_bloc.dart';

class ExplanationText extends StatelessWidget {
  const ExplanationText({
    super.key,
    required this.questionId,
    this.padding = const EdgeInsets.all(16),
  });

  final String questionId;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionSheetBloc, QuestionSheetState>(
      buildWhen: (previous, current) {
        return previous.evaluationResult != current.evaluationResult;
      },
      builder: (context, state) {
        final result = state.getEvaluationQuestionResult(questionId);
        if (result != null) {
          final explanation = result.explanation ?? '';
          if (explanation.isNotEmpty) {
            return Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: padding,
                child: Text(
                  explanation,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            );
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
