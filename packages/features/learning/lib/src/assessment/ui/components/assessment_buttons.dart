import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/assessment/bloc/assessment_bloc.dart';
import 'package:ui/ui.dart';

import '../../../common/common.dart';
import '../../bloc/bloc.dart';

class AssessmentNavigationButtonBar extends StatelessWidget {
  const AssessmentNavigationButtonBar({
    super.key,
    required this.courseNavigator,
  });

  final CourseNavigator courseNavigator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) =>
          previous.hasSavedAssessment != current.hasSavedAssessment ||
          previous.courseLearnerUiState != current.courseLearnerUiState,
      builder: (context, state) {
        return CourseNavigationButtonBar(
          courseNavigator: courseNavigator,
          isNextEnabled: state.hasSavedAssessment,
        );
      },
    );
  }
}

class AssessmentSaveButton extends StatelessWidget {
  const AssessmentSaveButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) =>
          previous.saveAssessmentUiState != current.saveAssessmentUiState,
      builder: (context, state) {
        final isInProgress = state.saveAssessmentUiState.isInProgress;
        final isSaved = state.saveAssessmentUiState.isSuccess;
        return SizedBox(
          width: double.infinity,
          child: MtpPrimarySubmitButton(
            onPressed: onPressed,
            isInProgress: isInProgress,
            labelText: isSaved
                ? context.l10n.courseAssessmentLabelSaved
                : context.l10n.courseAssessmentButtonTextSave,
          ),
        );
      },
    );
  }
}

class AssessmentSubmitButton extends StatelessWidget {
  const AssessmentSubmitButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) =>
          previous.assessmentSubmissionUiState !=
              current.assessmentSubmissionUiState ||
          previous.isLastQuestion != current.isLastQuestion ||
          previous.isSubmittable != current.isSubmittable,
      builder: (context, state) {
        if (!state.isLastQuestion) {
          return const SizedBox.shrink();
        }

        final isInProgress = state.assessmentSubmissionUiState.isInProgress;
        return SizedBox(
          width: double.infinity,
          child: MtpPrimarySubmitButton(
            onPressed: state.isSubmittable ? onPressed : null,
            isInProgress: isInProgress,
            labelText: context.l10n.courseAssessmentButtonTextSubmit,
          ),
        );
      },
    );
  }
}

class ShowCorrectAnswersButton extends StatelessWidget {
  const ShowCorrectAnswersButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      buildWhen: (previous, current) =>
          previous.assessmentSubmissionUiState !=
          current.assessmentSubmissionUiState,
      builder: (context, state) {
        final result = state.assessmentSubmissionUiState.dataOrNull;
        if (result == null || result.isPass) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: double.infinity,
          child: MtpPrimaryButton(
            onPressed: () {
              context
                  .read<AssessmentBloc>()
                  .add(const AssessmentCorrectAnswersShown());
            },
            labelText: context.l10n.courseAssessmentButtonTextShowCorrectAnswers,
          ),
        );
      },
    );
  }
}
