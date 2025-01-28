import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../settings.dart';
import 'components/components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.onChangePasswordClicked,
    required this.onLogoutClicked,
    required this.onDeactivateClicked,
  });

  final ChangePasswordClickCallback onChangePasswordClicked;
  final LogoutClickCallback onLogoutClicked;
  final DeactivateClickCallback onDeactivateClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.settingsLabelTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Grid.two,
            vertical: Grid.two,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LanguageSetting(),
              const Divider(thickness: 1, height: 1),
              const SizedBox(height: Grid.two),
              Subheading(text: context.l10n.settingsLabelAccountSettings),
              ChangePasswordListTile(
                onChangePasswordClicked: onChangePasswordClicked,
              ),
              DeleteAccountListTile(
                onPressed: onDeactivateClicked,
              ),
              const Spacer(),
              LogOutButton(
                onPressed: onLogoutClicked,
              ),
            ],
          ),
        ));
  }
}
