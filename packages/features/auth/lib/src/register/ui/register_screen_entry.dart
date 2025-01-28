import 'package:auth/src/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../auth.dart';
import 'register_screen.dart';

typedef FormSubmittedCallback = void Function({
  required String email,
});

class RegisterScreenEntry extends StatelessWidget {
  const RegisterScreenEntry({
    super.key,
    required this.onFormSubmitted,
    required this.onUnverifiedUser,
  });

  final FormSubmittedCallback onFormSubmitted;
  final UnverifiedUserCallback onUnverifiedUser;

  @override
  Widget build(BuildContext context) {
    final countryCode =
        WidgetsBinding.instance.platformDispatcher.locale.countryCode;
    return BlocProvider(
      create: (context) => RegisterBloc(
        deviceCountryCode: getDialedCode(countryCode) ?? '',
      )
        ..add(const RegisterAccountTypesFetched())
        ..add(const RegisterCollegesFetched())
        ..add(const RegisterEducationYearsFetched()),
      child: RegisterScreen(
        onFormSubmitted: onFormSubmitted,
        onUnverifiedUser: onUnverifiedUser,
      ),
    );
  }
}
