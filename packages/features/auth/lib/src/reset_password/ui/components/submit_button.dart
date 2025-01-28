import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/reset_password_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: MtpPrimaryButton(
            labelText: state.isFormSubmissionInProgress
                ? context.l10n.forgotPasswordButtonTextResetPassword
                : context.l10n.forgotPasswordButtonTextResetPassword,
            onPressed: state.isFormSubmissionInProgress
                ? null
                : () {
                    hideKeyboard();
                    context
                        .read<ResetPasswordBloc>()
                        .add(const ResetPasswordSubmitted());
                  },
          ),
        );
      },
    );
  }
}
