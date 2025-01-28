import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'group_guest_user_screen_entry.dart';

class GroupGuestUserScreen extends StatelessWidget {
  const GroupGuestUserScreen({
    super.key,
    required this.scaffoldKey,
    required this.drawer,
    required this.onLoginClicked,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final LoginClickCallback onLoginClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer,
      appBar: buildMtpPrimaryAppBar(context, scaffoldKey),
      body: Padding(
        padding: const EdgeInsets.all(Grid.two),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MtpAssets.images.groupGuestUser.image(
                width: 250,
                height: 250,
              ),
              Text(context.l10n.groupLabelGuestWelcomeMessage),
              const SizedBox(height: Grid.two),
              MtpPrimaryButton(
                labelText: context.l10n.blogButtonTextLogin,
                onPressed: () => onLoginClicked(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
