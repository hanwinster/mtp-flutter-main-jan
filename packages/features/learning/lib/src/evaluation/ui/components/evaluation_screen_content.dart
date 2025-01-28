import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/evaluation/ui/components/components.dart';
import 'package:learning/src/evaluation/ui/evaluation_question_mapper.dart';
import 'package:questionnaire_kit/questionnaire_kit.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class EvaluationScreenContent extends StatefulWidget {
  const EvaluationScreenContent({
    super.key,
    required this.onCompleteEvent,
  });

  final CompleteEventHandler onCompleteEvent;

  @override
  State<EvaluationScreenContent> createState() =>
      _EvaluationScreenContentState();
}

class _EvaluationScreenContentState extends State<EvaluationScreenContent> {
  final QuestionSheetController _questionSheetController =
  QuestionSheetController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EvaluationBloc, EvaluationState>(
      listenWhen: (previous, current) =>
      previous.evaluationQuestionsUiState !=
          current.evaluationQuestionsUiState,
      listener: (context, state) {
        final evaluationQuestions = state.evaluationQuestionsUiState.dataOrNull;
        if (evaluationQuestions == null) {
          return;
        }

        _questionSheetController.setQuestions(
          mapToQuestionDataList(context, evaluationQuestions),
        );
      },
      child: BlocBuilder<EvaluationBloc, EvaluationState>(
        buildWhen: (previous, current) =>
        previous.evaluationQuestionsUiState !=
            current.evaluationQuestionsUiState,
        builder: (context, state) {
          return state.evaluationQuestionsUiState.toView(
            context,
            successViewBuilder: (questions) {
              return EvaluationQuestionSheet(
                questionSheetController: _questionSheetController,
              );
            },
          );
        },
      ),
    );
  }
}
