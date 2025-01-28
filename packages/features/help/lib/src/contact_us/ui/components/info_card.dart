import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.info,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String message;
  final String info;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: context.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Grid.one),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Grid.two,
              vertical: Grid.two,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title.isNotEmpty) ...[
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: context.colorScheme.onPrimary,
                        size: 16,
                      ),
                      const SizedBox(width: Grid.one),
                      Text(
                        title,
                        style: context.textTheme.titleSmall?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Grid.one),
                ],
                if (message.isNotEmpty) ...[
                  Text(
                    message,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: Grid.one),
                ],
                if (info.isNotEmpty) ...[
                  Text(
                    info,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
