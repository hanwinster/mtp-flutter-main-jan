import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class OfflineLearningModeIndicator extends StatelessWidget {
  const OfflineLearningModeIndicator({
    super.key,
    required this.onSwitchToOnline,
  });
  final Function() onSwitchToOnline;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.errorContainer,
      child: InkWell(
        onTap: () => _showOfflineLearningModeHelpDialog(context),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    context.l10n.courseLearningModeLabelOfflineTitle,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                right: Grid.one,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.help_outline,
                    color: context.colorScheme.onErrorContainer,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showOfflineLearningModeHelpDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.l10n.courseLearningModeLabelOfflineTitle),
          content: Text(context.l10n.courseLearningModeLabelOfflineMessage),
          actions: [
            TextButton(
              onPressed: () {
                onSwitchToOnline();
                Navigator.of(context).pop();
              },
              child:
                  Text(context.l10n.courseLearningModeButtonTextSwitchToOnline),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.courseLearningModeButtonTextStayOffline),
            ),
          ],
        );
      },
    );
  }
}
