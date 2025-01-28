import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'settings_screen.dart';

typedef LogoutClickCallback = void Function();
typedef DeactivateClickCallback = void Function();
typedef ChangePasswordClickCallback = void Function();

class SettingsScreenEntry extends StatelessWidget {
  const SettingsScreenEntry({
    super.key,
    required this.onChangePasswordClicked,
    required this.onLogoutClicked,
    required this.onDeactivateClicked
  });

  final ChangePasswordClickCallback onChangePasswordClicked;
  final LogoutClickCallback onLogoutClicked;
  final DeactivateClickCallback onDeactivateClicked;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(const SettingsLanguageFetched()),
      child: SettingsScreen(
        onChangePasswordClicked: onChangePasswordClicked,
        onLogoutClicked: onLogoutClicked,
        onDeactivateClicked: onDeactivateClicked,
      ),
    );
  }
}
