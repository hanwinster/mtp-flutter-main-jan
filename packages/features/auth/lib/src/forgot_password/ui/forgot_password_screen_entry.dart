import 'package:auth/auth.dart';
import 'package:auth/src/forgot_password/ui/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forgot_password_bloc.dart';

typedef ResetPasswordTokenSentCallback = void Function({
  required String credential,
});

class ForgotPasswordScreenEntry extends StatelessWidget {
  const ForgotPasswordScreenEntry({
    super.key,
    required this.onResetPasswordTokenSent,
    required this.onUnverifiedUser,
  });

  final ResetPasswordTokenSentCallback onResetPasswordTokenSent;
  final UnverifiedUserCallback onUnverifiedUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: ForgotPasswordScreen(
        onResetPasswordTokenSent: onResetPasswordTokenSent,
        onUnverifiedUser: onUnverifiedUser,
      ),
    );
  }
}
