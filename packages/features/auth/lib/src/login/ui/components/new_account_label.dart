import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class NewAccountLabel extends StatelessWidget {
  const NewAccountLabel({
    super.key,
    required this.onCreateNewUser,
  });

  final CreateNewUserClickCallback onCreateNewUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          context.l10n.loginLabelNewAccount,
          style: context.textTheme.labelMedium,
        ),
        MtpTextButton(
            onPressed: () => onCreateNewUser(),
            label: Text(
              context.l10n.loginButtonTextCreateNewAccount,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
            )),
      ],
    );
  }
}
