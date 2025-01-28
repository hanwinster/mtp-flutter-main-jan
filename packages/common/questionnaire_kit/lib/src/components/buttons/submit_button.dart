import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class QuestionSubmitButton extends StatelessWidget {
  const QuestionSubmitButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: onPressed,
      child: Text(context.l10n.courseEvaluationButtonTextSubmit),
    );
  }
}
