import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help/src/contact_us/bloc/bloc.dart';
import 'package:ui/ui.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionUiState != current.formSubmissionUiState,
      builder: (context, state) {
        final isInProgress = state.formSubmissionUiState.isInProgress;
        return SizedBox(
          width: double.infinity,
          child: MtpPrimarySubmitButton(
            isInProgress: isInProgress,
            labelText: context.l10n.contactUsButtonTextSend,
            onPressed: () {
                    hideKeyboard();
                    context
                        .read<ContactUsBloc>()
                        .add(const ContactUsSubmitted());
                  },
          ),
        );
      },
    );
  }
}
