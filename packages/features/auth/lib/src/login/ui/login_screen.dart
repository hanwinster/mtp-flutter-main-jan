import 'package:auth/auth.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import 'login_form.dart';
import '../bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    required this.onCreateNewUser,
    required this.onUnverifiedUser,
    required this.onForgotPassword,
    required this.onLoginSuccess,
  });

  final CreateNewUserClickCallback onCreateNewUser;
  final UnverifiedUserCallback onUnverifiedUser;
  final ForgotPasswordCallback onForgotPassword;
  final LoginSuccessCallback onLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.formSubmissionStatus != current.formSubmissionStatus,
      listener: (context, state) {
        if (state.formSubmissionStatus is UiStateSuccess) {
          final message = state.formSubmissionStatus.dataOrNull?.message ?? '';
          if (message.isNotEmpty) {
            showSnackBar(context, message);
            context.read<LoginBloc>().add(const LoginResultShown());
          }
          onLoginSuccess();
        } else if (state.formSubmissionStatus is UiStateFailure) {
          final data = state.formSubmissionStatus.dataOrNull;
          if (data is LoginResultUnverified) {
            showSnackBar(
                context, state.formSubmissionStatus.messageOrEmpty(context));
            onUnverifiedUser(credential: data.credential);
          } else if (data is LoginResultInvalidCredentials) {
            showSnackBar(
                context, state.formSubmissionStatus.messageOrEmpty(context));
          } else {
            showSnackBar(
                context, state.formSubmissionStatus.messageOrEmpty(context));
          }
          context.read<LoginBloc>().add(const LoginResultShown());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: LoginForm(
            onCreateNewUser: onCreateNewUser,
            onForgotPassword: onForgotPassword,
          ),
        ),
      ),
    );
  }
}
