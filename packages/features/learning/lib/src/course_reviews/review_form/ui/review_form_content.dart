import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/bloc.dart';
import 'components/components.dart';

class ReviewForm extends StatelessWidget {
  const ReviewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _FormSubmissionIndicator(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Grid.two,
              vertical: Grid.two,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Subheader(
                  text: context.l10n.courseReviewLabelNewReviewGuide,
                ),
                const RatingInput(),
                const SizedBox(height: Grid.two),
                _Subheader(
                  text: context.l10n.courseReviewLabelNewReviewInput,
                ),
                const RemarkInput(),
                const Spacer(),
                const _SubmitButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Subheader extends StatelessWidget {
  const _Subheader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleSmall,
    );
  }
}

class _FormSubmissionIndicator extends StatelessWidget {
  const _FormSubmissionIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewFormBloc, ReviewFormState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      builder: (context, state) {
        final isInProgress = state.formSubmissionUiState.isInProgress;
        if (!isInProgress) {
          return const SizedBox.shrink();
        }

        return const LinearProgressIndicator(
          minHeight: 2,
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewFormBloc, ReviewFormState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      builder: (context, state) {
        final isInProgress = state.formSubmissionUiState.isInProgress;
        return SizedBox(
          width: double.infinity,
          child: MtpPrimarySubmitButton(
            isInProgress: isInProgress,
            labelText: context.l10n.courseReviewButtonTextSubmitReview,
            onPressed: () {
              context.read<ReviewFormBloc>().add(const ReviewFormSubmitted());
            },
          ),
        );
      },
    );
  }
}
