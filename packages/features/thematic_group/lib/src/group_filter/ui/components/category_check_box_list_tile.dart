import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CategoryCheckBoxListTile extends StatelessWidget {
  const CategoryCheckBoxListTile({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        text,
        style: context.textTheme.bodyLarge,
      ),
      checkColor: context.colorScheme.onPrimary,
      activeColor: context.colorScheme.primary,
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: (value) => onChanged(value),
    );
  }
}
