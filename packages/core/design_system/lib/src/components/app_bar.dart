import 'package:assets/assets.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

AppBar buildMtpPrimaryAppBar(
  BuildContext context,
  GlobalKey<ScaffoldState> scaffoldKey, {
  List<Widget>? actions,
}) {
  return AppBar(
    centerTitle: true,
    title: MtpAssets.images.appIcon.image(
      width: 36,
      height: 36,
    ),
    leading: IconButton(
      icon: MtpAssets.images.drawerMenuIcon.image(
        width: 24,
        height: 24,
      ),
      onPressed: () => scaffoldKey.currentState?.openDrawer(),
    ),
    actions: actions,
    backgroundColor: context.colorScheme.primary,
  );
}

typedef NotificationActionClickCallback = void Function();

class NotificationActionButton extends StatelessWidget {
  const NotificationActionButton({
    super.key,
    required this.onClicked,
  });

  final NotificationActionClickCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onClicked(),
      icon: Icon(
        Icons.notifications,
        color: context.colorScheme.onPrimary,
      ),
    );
  }
}
