import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profile_bloc.dart';
import 'profile_screen.dart';

typedef EditProfileClickCallback = void Function();

typedef HelpClickCallback = void Function();

typedef SettingsClickCallback = void Function();

class ProfileScreenEntry extends StatelessWidget {
  const ProfileScreenEntry({
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
    return BlocProvider(
      create: (context) => ProfileBloc()..add(const ProfileUserFetched()),
      child: ProfileScreen(
        onEditProfileClicked: onEditProfileClicked,
        onHelpClicked: onHelpClicked,
        onSettingsClicked: onSettingsClicked,
      ),
    );
  }
}
