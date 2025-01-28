import 'package:flutter/material.dart';

import '../../common.dart';

class LearningAppBarBackButton extends StatelessWidget {
  const LearningAppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(onPressed: () async {
      final NavigatorState navigator = Navigator.of(context);
      final bool shouldPop = await showLearningQuitConfirmationDialog(context) ?? false;
      if (context.mounted && shouldPop) {
        navigator.pop();
      }
    });
  }
}
