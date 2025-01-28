import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'reset_password_screen.dart';
import '../bloc/reset_password_bloc.dart';

typedef PasswordResetSuccessCallback = void Function({
  required String credential,
  required String message,
});

class ResetPasswordScreenEntry extends StatelessWidget {
  const ResetPasswordScreenEntry({
    super.key,
    required this.credential,
    required this.otp,
    required this.onPasswordResetSuccess,
  });

  final String credential;
  final String otp;
  final PasswordResetSuccessCallback onPasswordResetSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(
        credential: credential,
        otp: otp,
      ),
      child: ResetPasswordScreen(
        onPasswordResetSuccess: onPasswordResetSuccess,
      ),
    );
  }
}
