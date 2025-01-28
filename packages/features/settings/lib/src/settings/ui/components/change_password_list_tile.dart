import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../settings_screen_entry.dart';

class ChangePasswordListTile extends StatelessWidget {
  const ChangePasswordListTile({
    super.key,
    required this.onChangePasswordClicked,
  });

  final ChangePasswordClickCallback onChangePasswordClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.l10n.settingsLabelChangePassword),
      leading: const Icon(Icons.lock),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => onChangePasswordClicked(),
    );
  }
}
