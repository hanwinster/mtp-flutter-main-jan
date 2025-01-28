import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CompleteStatusIndicator extends StatelessWidget {
  const CompleteStatusIndicator({
    super.key,
    required this.isCompleted,
  });

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return isCompleted
        ? Icon(
            Icons.check_box_outlined,
            color: context.colorScheme.primary,
          )
        : Icon(
            Icons.check_box_outline_blank_outlined,
            color: context.colorScheme.iconMediumEmphasis,
          );
  }
}
