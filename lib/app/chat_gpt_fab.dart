import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ChatGptFab extends StatelessWidget {
  const ChatGptFab({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    return Positioned(
      bottom: bottomPadding + kBottomNavigationBarHeight + 16,
      right: 16,
      child: FloatingActionButton(
        heroTag: 'chatGPT',
        onPressed: onPressed,
        backgroundColor: context.colorScheme.primary,
        child: MtpAssets.icons.robot.svg(
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}
