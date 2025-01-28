import 'package:flutter/material.dart';

class HintText extends StatelessWidget {
  const HintText({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      hintText,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.85),
      ),
    );
  }
}
