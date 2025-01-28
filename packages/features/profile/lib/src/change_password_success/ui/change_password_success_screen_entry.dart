import 'package:flutter/material.dart';

import 'change_password_success_screen.dart';

typedef PositiveButtonClickCallback = void Function();

class ChangePasswordSuccessScreenEntry extends StatelessWidget {
  const ChangePasswordSuccessScreenEntry({
    super.key,
    required this.onPositiveButtonClicked,
    required this.message,
  });

  final PositiveButtonClickCallback onPositiveButtonClicked;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ChangePasswordSuccessScreen(
      onPositiveButtonClicked: onPositiveButtonClicked,
      message: message,
    );
  }
}
