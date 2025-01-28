import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.child,
    this.isInProgress = false,
    this.scrollable = true,
  });

  final bool scrollable;
  final bool isInProgress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: scrollable
              ? LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Grid.two,
                      vertical: Grid.two,
                    ),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                            minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Container(
                            color: context.colorScheme.surface,
                            child: child,
                          ),
                        )),
                  );
                })
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Grid.two,
                    vertical: Grid.two,
                  ),
                  child: child,
                ),
        ),
        if (isInProgress)
          Positioned.fill(
            child: Column(
              children: [
                const LinearProgressIndicator(minHeight: 2),
                Expanded(
                  child: Container(
                    color: context.colorScheme.onSurface.withOpacity(0.36),
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
    required this.child,
    this.showOfflineIndicator = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final bool showOfflineIndicator;
  final Widget child;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (showOfflineIndicator) const MtpOfflineIndicator(),
        Expanded(child: child),
      ],
    );
  }
}
