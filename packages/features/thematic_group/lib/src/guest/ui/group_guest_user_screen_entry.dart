import 'package:flutter/material.dart';

import 'group_guest_user_screen.dart';

typedef LoginClickCallback = void Function();

class GroupGuestUserScreenEntry extends StatelessWidget {
  const GroupGuestUserScreenEntry({
    super.key,
    required this.drawer,
    required this.scaffoldKey,
    required this.onLoginClicked,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final LoginClickCallback onLoginClicked;

  @override
  Widget build(BuildContext context) {
    return GroupGuestUserScreen(
      drawer: drawer,
      scaffoldKey: scaffoldKey,
      onLoginClicked: onLoginClicked,
    );
  }
}
