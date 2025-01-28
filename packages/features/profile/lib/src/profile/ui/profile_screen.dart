import 'package:flutter/material.dart';
import 'package:profile/src/profile/ui/profile_content.dart';
import 'package:ui/ui.dart';

import '../profile.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.onEditProfileClicked,
    required this.onHelpClicked,
    required this.onSettingsClicked,
  });
  final EditProfileClickCallback onEditProfileClicked;
  final HelpClickCallback onHelpClicked;
  final SettingsClickCallback onSettingsClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => onHelpClicked(),
            tooltip: context.l10n.helpLabelTitle,
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => onSettingsClicked(),
          ),
        ],
      ),
      body: ProfileContent(
        onEditProfileClicked: onEditProfileClicked,
      ),
    );
  }
}
