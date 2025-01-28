import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class InfoItemListTile extends StatelessWidget {
  const InfoItemListTile({
    super.key,
    required this.caption,
    required this.value,
  });

  final String caption;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        caption,
        style: context.textTheme.bodySmall,
      ),
      subtitle: Text(
        value,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
