import 'package:flutter/material.dart';

class MtpCheckbox extends StatelessWidget {
  const MtpCheckbox({
    super.key,
    this.label,
    this.labelText,
    required this.value,
    required this.onChanged,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.enabled = true,
  });
  final Widget? label;
  final String? labelText;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final ListTileControlAffinity controlAffinity;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CheckboxListTile(
      enabled: enabled,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: colorScheme.primary,
      contentPadding: EdgeInsets.zero,
      title: label ?? Text(labelText ?? ''),
      value: value,
      controlAffinity: controlAffinity,
      onChanged: (value) => onChanged(value),
    );
  }
}