import 'package:flutter/material.dart';

class MtpRadioButton<T> extends StatelessWidget {
  const MtpRadioButton({
    super.key,
    required this.titleText,
    this.enabled = true,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.controlAffinity = ListTileControlAffinity.leading,
  });
  final String titleText;
  final bool enabled;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return RadioListTile<T>(
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: colorScheme.primary,
      contentPadding: EdgeInsets.zero,
      title: Text(titleText),
      value: value,
      groupValue: groupValue,
      controlAffinity: controlAffinity,
      onChanged: enabled ? (value) => onChanged(value) : null,
    );
  }
}