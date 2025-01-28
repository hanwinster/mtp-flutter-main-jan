import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ReplyButton extends StatelessWidget {
  const ReplyButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(context.l10n.txtReply),
    );
  }
}
