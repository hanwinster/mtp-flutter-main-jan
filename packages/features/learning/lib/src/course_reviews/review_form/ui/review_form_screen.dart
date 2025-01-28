import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../ui/components/components.dart';
import '../bloc/review_form_bloc.dart';

class ReviewFormScreen extends StatelessWidget {
  const ReviewFormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewFormBloc, ReviewFormState>(
      listenWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      listener: (context, state) {
        if (state.formSubmissionUiState is UiStateSuccess) {
          Navigator.of(context).pop(true);
        } else if (state.formSubmissionUiState is UiStateFailure) {
          showSnackBar(context, state.formSubmissionUiState.messageOrEmpty(context));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.courseReviewLabelWriteAReview),
          elevation: 0,
        ),
        body: const ReviewForm(),
      ),
    );
  }
}
