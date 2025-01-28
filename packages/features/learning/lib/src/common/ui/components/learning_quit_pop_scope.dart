import 'package:flutter/material.dart';

import '../../common.dart';

class LearningQuitPopScope extends StatelessWidget {
  const LearningQuitPopScope({
    super.key,
    required this.navigationEventHandler,
    required this.child,
  });

  final CourseNavigationEventHandler navigationEventHandler;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        final bool shouldPop = await showLearningQuitConfirmationDialog(context) ?? false;
        if (context.mounted && shouldPop) {
          navigationEventHandler.onCloseEvent();
        }
      },
      child: child,
    );
  }
}
