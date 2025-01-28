import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class LearningAreaContainer extends StatelessWidget {
  const LearningAreaContainer({
    super.key,
    required this.child,
    this.navigationButtonBar,
  });

  final Widget child;
  final Widget? navigationButtonBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        if (navigationButtonBar != null) ...[
          const SizedBox(height: Grid.two),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            child: navigationButtonBar!,
          ),
        ],
        const SizedBox(height: Grid.two),
      ],
    );
  }
}
