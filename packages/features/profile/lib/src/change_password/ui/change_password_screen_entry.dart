import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/change_password_bloc.dart';
import 'change_password_screen.dart';

typedef ChangePasswordSuccessCallback = void Function({
  required String message,
});

class ChangePasswordScreenEntry extends StatelessWidget {
  const ChangePasswordScreenEntry({
    super.key,
    required this.onChangePasswordSuccess,
  });

  final ChangePasswordSuccessCallback onChangePasswordSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(),
      child: ChangePasswordScreen(
        onChangePasswordSuccess: onChangePasswordSuccess,
      ),
    );
  }
}
