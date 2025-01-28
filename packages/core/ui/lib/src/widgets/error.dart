import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class MtpError extends StatelessWidget {
  const MtpError({
    super.key,
    required this.error,
    required this.onRetried,
  });

  final UiStateFailure error;
  final Function()? onRetried;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Grid.two,
        vertical: Grid.two,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(error.resolveMessage(context))),
          if (error.retryable) ...[
            SizedBox(height: Grid.grid(2)),
            MtpTextButton(
              labelText: context.l10n.buttonTextRetry,
              onPressed: () => onRetried?.call(),
            ),
          ]
        ],
      ),
    );
  }
}
