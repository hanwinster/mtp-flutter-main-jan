import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/group_home_bloc.dart';
import 'group_home_screen.dart';

typedef OnGroupTapped = void Function(ThematicGroupListing group);
typedef OnLoginClicked = void Function();

class GroupHomeScreenEntry extends StatelessWidget {
  const GroupHomeScreenEntry({
    super.key,
    required this.drawer,
    required this.scaffoldKey,
    required this.onGroupTapped,
    required this.onLoginClicked,
    required this.onNotiClick,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final OnGroupTapped onGroupTapped;
  final OnLoginClicked onLoginClicked;
  final NotificationActionClickCallback onNotiClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupHomeBloc(),
      child: GroupHomeScreen(
        drawer: drawer,
        scaffoldKey: scaffoldKey,
        onGroupTapped: onGroupTapped,
        onLoginClicked: onLoginClicked,
        onNotiClick: onNotiClick,
      ),
    );
  }
}
