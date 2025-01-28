import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class EvaluationSubmitButton extends StatelessWidget {
  const EvaluationSubmitButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EvaluationBloc, EvaluationState>(
      buildWhen: (previous, current) =>
          previous.answerSubmissionUiState != current.answerSubmissionUiState,
      builder: (context, state) {
        final isInProgress = state.answerSubmissionUiState.isInProgress;
        return SizedBox(
          width: double.infinity,
          child: MtpPrimarySubmitButton(
            isInProgress: isInProgress,
            onPressed: onPressed,
            labelText: context.l10n.courseEvaluationButtonTextSubmit,
          ),
        );
      },
    );
  }
}
