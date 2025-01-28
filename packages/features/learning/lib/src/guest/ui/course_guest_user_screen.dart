import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../course_guest.dart';

class CourseGuestUserScreen extends StatelessWidget {
  const CourseGuestUserScreen({
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
              MtpAssets.images.courseGuestUser.svg(
                width: 250,
                height: 250,
              ),
              Text(context.l10n.courseLableGuestUserMessage),
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
