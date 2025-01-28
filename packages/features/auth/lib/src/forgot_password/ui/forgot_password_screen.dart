import 'package:auth/auth.dart';
import 'package:auth/src/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:auth/src/forgot_password/ui/forgot_password_form.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({
    super.key,
    required this.onResetPasswordTokenSent,
    required this.onUnverifiedUser,
  });

  final UnverifiedUserCallback onUnverifiedUser;
  final ResetPasswordTokenSentCallback onResetPasswordTokenSent;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }

          if (context
              .read<ForgotPasswordBloc>()
              .state
              .isFormSubmissionInProgress) {
            return;
          }

          Navigator.of(context).pop();
        },
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listenWhen: (previous, current) =>
              previous.formSubmissionStatus != current.formSubmissionStatus,
          listener: (context, state) {
            if (state.formSubmissionStatus is UiStateSuccess) {
              final message =
                  state.formSubmissionStatus.dataOrNull?.message ?? '';
              if (message.isNotEmpty) {
                showSnackBar(context, message);
              }
              onResetPasswordTokenSent(
                  credential: state.emailState.value
              );
            } else if (state.formSubmissionStatus is UiStateFailure) {
              final data = state.formSubmissionStatus.dataOrNull;
              if (data is InitiateResetPasswordResultUnverified) {
                showSnackBar(context,
                    state.formSubmissionStatus.messageOrEmpty(context));

                onUnverifiedUser(credential: state.emailState.value);
              } else if (data
                  is InitiateResetPasswordResultInvalidCredentials) {
                showSnackBar(context,
                    state.formSubmissionStatus.messageOrEmpty(context));
              } else {
                showSnackBar(context,
                    state.formSubmissionStatus.messageOrEmpty(context));
              }
              context
                  .read<ForgotPasswordBloc>()
                  .add(const ForgotPasswordResultShown());
            }
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: const ForgotPasswordForm(),
          ),
        ));
  }
}
