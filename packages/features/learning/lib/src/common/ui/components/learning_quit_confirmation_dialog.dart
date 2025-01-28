import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

Future<bool?> showLearningQuitConfirmationDialog(BuildContext parentContext) {
  return showDialog<bool>(
    context: parentContext,
    builder: (context) {
      return AlertDialog(
        title: Text(context.l10n.courseExistConfirmationLabelTitle),
        content: Text(
          context.l10n.courseExistConfirmationLabelMessage,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              context.l10n.courseExistConfirmationButtonTextLeave,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.textMediumEmphasis,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              context.l10n.courseExistConfirmationButtonTextStay,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ],
      );
    },
  );
}