import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import 'login_screen.dart';

typedef CreateNewUserClickCallback = void Function();

typedef UnverifiedUserCallback = void Function({
  required String credential,
});

typedef ForgotPasswordCallback = void Function();

typedef LoginSuccessCallback = void Function();

class LoginScreenEntry extends StatelessWidget {
  const LoginScreenEntry({
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
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginScreen(
        onCreateNewUser: onCreateNewUser,
        onUnverifiedUser: onUnverifiedUser,
        onForgotPassword: onForgotPassword,
        onLoginSuccess: onLoginSuccess,
      ),
    );
  }
}
