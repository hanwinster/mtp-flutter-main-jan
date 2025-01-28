import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ui/ui.dart';

import '../../models/models.dart';

class CourseDiscussionMessageTile extends StatefulWidget {
  const CourseDiscussionMessageTile({
    super.key,
    required this.item,
  });

  final UiDiscussionMessageItem item;

  @override
  State<CourseDiscussionMessageTile> createState() =>
      _CourseDiscussionMessageTileState();
}

class _CourseDiscussionMessageTileState
    extends State<CourseDiscussionMessageTile> {
  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('my', timeago.MyMessages());
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.item.message;

    return Card(
      color: widget.item.isMine ? context.colorScheme.primaryContainer : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: context.colorScheme.outline.withOpacity(0.12),
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.two,
          vertical: Grid.two,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _Avatar(),
                const SizedBox(
                  width: Grid.two,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (message.user?.fullName ?? '').maskName,
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: Grid.half),
                      Text(
                        timeago.format(
                          message.createdAt,
                          locale: context.locale,
                        ),
                        style: context.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (message.message.isNotEmpty) ...[
              const SizedBox(height: Grid.one),
              ReadMoreText(
                message.message,
                trimMode: TrimMode.Line,
                colorClickableText: context.colorScheme.primary,
                trimLines: 3,
                trimCollapsedText: context.l10n.postLabelReadMore,
                trimExpandedText: context.l10n.postLabelReadLess,
                style: context.textTheme.bodyLarge,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: context.colorScheme.primary.withOpacity(0.12),
          shape: BoxShape.circle),
      child: const Icon(Icons.person),
    );
  }
}
