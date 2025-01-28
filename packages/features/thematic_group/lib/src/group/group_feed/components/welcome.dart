import 'package:flutter/cupertino.dart';
import 'package:ui/ui.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.groupLabelWelcome,
      style: context.textTheme.titleMedium,
    );
  }
}
