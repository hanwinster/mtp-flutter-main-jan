import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class InteractionItem extends StatelessWidget {
  const InteractionItem({
    super.key,
    required this.icon,
    required this.text,
    this.textColor,
  });

  final Widget icon;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: context.textTheme.labelLarge?.copyWith(color: textColor),
        ),
      ],
    );
  }
}
