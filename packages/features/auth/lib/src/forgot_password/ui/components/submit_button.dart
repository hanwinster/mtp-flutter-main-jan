import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/forgot_password_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: MtpPrimaryButton(
            labelText: state.isFormSubmissionInProgress
                ? context.l10n.forgotPasswordButtonTextContinue
                : context.l10n.forgotPasswordButtonTextContinue,
            onPressed: state.isFormSubmissionInProgress
                ? null
                : () {
                    hideKeyboard();
                    context
                        .read<ForgotPasswordBloc>()
                        .add(const ForgotPasswordSubmitted());
                  },
          ),
        );
      },
    );
  }
}
