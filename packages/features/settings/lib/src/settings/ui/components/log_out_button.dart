import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MtpOutlinedButton(
        onPressed: () => onPressed(),
        labelText: context.l10n.settingsButtonTextLogout,
        icon: const Icon(Icons.logout),
      ),
    );
  }
}
