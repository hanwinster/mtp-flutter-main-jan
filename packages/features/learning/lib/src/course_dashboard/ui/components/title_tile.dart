import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'components.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({
    super.key,
    required this.title,
    required this.isCompleted,
    this.maxLines,
    this.overflow,
    required this.onTap,
  });

  final String title;
  final bool isCompleted;
  final int? maxLines;
  final TextOverflow? overflow;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: ListTileTheme.of(context).copyWith(
          minLeadingWidth: Grid.zero,
        ),
      ),
      child: ListTile(
        tileColor: context.colorScheme.primary.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Grid.one),
        ),
        leading: CompleteStatusIndicator(isCompleted: isCompleted),
        title: MtpHtmlPlainText(
          title,
          textStyle: context.textTheme.titleSmall?.copyWith(
            color: context.colorScheme.primary,
          ),
          overflow: overflow,
          maxLines: maxLines,
        ),
        onTap: onTap,
      ),
    );
  }
}

class SubmoduleTitleTile extends StatelessWidget {
  const SubmoduleTitleTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onTap,
    this.showThumbnail = true,
  });

  final String title;
  final bool isCompleted;
  final Function() onTap;
  final bool showThumbnail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: context.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Grid.two,
            vertical: Grid.two,
          ),
          child: Row(
            children: [
              CompleteStatusIndicator(isCompleted: isCompleted),
              if (showThumbnail) ...[
                const SizedBox(width: Grid.one),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(Grid.one),
                  ),
                ),
              ],
              const SizedBox(width: Grid.two),
              Expanded(
                child: MtpHtmlPlainText(
                  title,
                  textStyle: context.textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
