import 'package:auth/auth.dart';
import 'package:auth/src/reset_password/ui/reset_password_form.dart';
import 'package:auth/src/reset_password/ui/reset_password_screen_entry.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/reset_password_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.onPasswordResetSuccess,
  });

  final PasswordResetSuccessCallback onPasswordResetSuccess;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }

          if (context
              .read<ResetPasswordBloc>()
              .state
              .isFormSubmissionInProgress) {
            return;
          }

          Navigator.of(context).pop();
        },
        child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
          listenWhen: (previous, current) =>
              previous.formSubmissionStatus != current.formSubmissionStatus,
          listener: (context, state) {
            if (state.formSubmissionStatus is UiStateSuccess) {
              final message =
                  state.formSubmissionStatus.dataOrNull?.message ?? '';
              onPasswordResetSuccess(
                credential: state.credential,
                message: message,
              );
            } else if (state.formSubmissionStatus is UiStateFailure) {
              final data = state.formSubmissionStatus.dataOrNull;
              if (data is ResetPasswordResultInvalidCredentials) {
                showSnackBar(context,
                    state.formSubmissionStatus.messageOrEmpty(context));
              } else {
                showSnackBar(context,
                    state.formSubmissionStatus.messageOrEmpty(context));
              }
              context
                  .read<ResetPasswordBloc>()
                  .add(const ResetPasswordResultShown());
            }
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: const ResetPasswordForm(),
          ),
        ));
  }
}
