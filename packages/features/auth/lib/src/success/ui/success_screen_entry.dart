import 'package:flutter/material.dart';

import 'success_screen.dart';

typedef PositiveButtonClickCallback = void Function();

class SuccessScreenEntry extends StatelessWidget {
  const SuccessScreenEntry({
    super.key,
    required this.onPositiveButtonClicked,
    required this.message,
  });

  final PositiveButtonClickCallback onPositiveButtonClicked;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      onPositiveButtonClicked: onPositiveButtonClicked,
      message: message,
    );
  }
}
