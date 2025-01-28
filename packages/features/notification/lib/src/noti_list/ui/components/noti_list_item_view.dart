import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:html_unescape/html_unescape.dart';

class NotiListItemView extends StatelessWidget {
  const NotiListItemView({
    super.key,
    required this.item,
    required this.onTap,
  });

  final NotificationItem item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          // MtpImage(
          //   item.coverImage,
          //   width: 100,
          //   height: 100,
          // ),
          // const SizedBox(width: Grid.two),
          Icon(
            Icons.notifications_active,
            color: context.colorScheme.primary,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.notificationData.title,
                  style: context.textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Grid.half),
                // Text(
                //   item.notificationData.body,
                //   style: context.textTheme.bodyMedium?.copyWith(color: MtpColors.grey),
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    heightFactor:
                        1.0, // This will clip to two lines' worth of content
                    child: MtpHtml(
                      HtmlUnescape().convert(item.notificationData.body),
                      textStyle: context.textTheme.bodyMedium
                          ?.copyWith(color: MtpColors.grey, height: 1.4),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
