import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../common/common.dart';
import '../../bloc/bloc.dart';

class QuizNavigationButtonBar extends StatelessWidget {
  const QuizNavigationButtonBar({super.key, required this.courseNavigator});

  final CourseNavigator courseNavigator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      buildWhen: (previous, current) =>
          previous.hasAnswered != current.hasAnswered ||
          previous.courseLearnerUiState != current.courseLearnerUiState,
      builder: (context, state) {
        return CourseNavigationButtonBar(
          courseNavigator: courseNavigator,
          isNextEnabled: state.hasAnswered,
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.isEvaluableQuiz,
    required this.onSubmitAnswerPressed,
    required this.onCheckAnswerPressed,
    required this.onRetakeQuizPressed,
  });

  final bool isEvaluableQuiz;
  final Function() onSubmitAnswerPressed;
  final Function() onCheckAnswerPressed;
  final Function() onRetakeQuizPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<QuizBloc, QuizState>(
        buildWhen: (previous, current) =>
            previous.hasAnswered != current.hasAnswered,
        builder: (context, state) {
          return isEvaluableQuiz
              ? (state.hasAnswered
                  ? ElevatedButton(
                      onPressed: onRetakeQuizPressed,
                      child: Text(
                          context.l10n.blogQuizCompletionButtonTextRetakeQuiz),
                    )
                  : ElevatedButton(
                      onPressed: onCheckAnswerPressed,
                      child:
                          Text(context.l10n.learningQuizButtonTextCheckAnswer),
                    ))
              : BlocBuilder<QuizBloc, QuizState>(
                  buildWhen: (previous, current) =>
                      previous.answerSubmissionUiState !=
                      current.answerSubmissionUiState,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.answerSubmissionUiState.isInProgress
                          ? null
                          : () => onSubmitAnswerPressed(),
                      child: Text(context.l10n.blogQuizButtonTextSumitAnswer),
                    );
                  },
                );
        },
      ),
    );
  }
}
