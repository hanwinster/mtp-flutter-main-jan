import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class Subheading extends StatelessWidget {
  const Subheading({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleMedium,
    );
  }
}
