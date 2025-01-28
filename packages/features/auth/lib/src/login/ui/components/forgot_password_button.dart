import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.onTapped,
  });

  final Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return MtpTextButton(
      onPressed: () => onTapped(),
      label: Text(
        context.l10n.loginButtonTextForgotPassword,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
