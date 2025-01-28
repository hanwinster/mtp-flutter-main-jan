import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/evaluation/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../bloc/evaluation_bloc.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({
    super.key,
    required this.onCompleteEvent,
  });

  final CompleteEventHandler onCompleteEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.courseLabelEvaluations),
        elevation: 0,
        scrolledUnderElevation: 2,
      ),
      body: BlocListener<EvaluationBloc, EvaluationState>(
        listenWhen: (previous, current) =>
            previous.answerSubmissionUiState != current.answerSubmissionUiState,
        listener: (context, state) {
          if (state.answerSubmissionUiState is UiStateSuccess) {
            onCompleteEvent();
          } else if (state.answerSubmissionUiState is UiStateFailure) {
            showSnackBar(
              context,
              state.answerSubmissionUiState.messageOrEmpty(context),
            );
          }
        },
        child: EvaluationScreenContent(
          onCompleteEvent: onCompleteEvent,
        ),
      ),
    );
  }
}
