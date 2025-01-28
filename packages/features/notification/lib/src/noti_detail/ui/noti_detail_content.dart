import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../noti_detail.dart';
import 'package:html_unescape/html_unescape.dart';

class NotiDetailContent extends StatefulWidget {
  const NotiDetailContent({
    super.key,
    required this.noti,
    required this.onLaunchNotiEvent,
  });

  final NotificationItem noti;
  final LaunchNotiEventHandler onLaunchNotiEvent;

  @override
  State<NotiDetailContent> createState() => _NotiDetailContentState();
}

class _NotiDetailContentState extends State<NotiDetailContent> {
  bool isHtml(String data) {
    final htmlRegex = RegExp(r'<[^>]+>'); // matches any HTML tag
    return htmlRegex.hasMatch(data);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Grid.two),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(BorderRadiusSize.normal),
                child: MtpImage(
                  widget.noti.notificationData.iconImage,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: Grid.two),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.appFullName,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Grid.quarter),
                  Text(
                    timeago.format(
                      widget.noti.createdAt,
                      locale: context.locale,
                    ),
                    style: context.textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(height: Grid.two),
          Text(
            widget.noti.notificationData.title,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: Grid.two),
          isHtml(widget.noti.notificationData.body)
              ? MtpHtml(
                  HtmlUnescape().convert(widget.noti.notificationData.body),
                  textStyle: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurface.withOpacity(0.87),
                    height: 1.5,
                  ),
                )
              : Text(HtmlUnescape().convert(widget.noti.notificationData.body),
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurface.withOpacity(0.87),
                    height: 1.5,
                  )),
          const SizedBox(height: Grid.four),
          if (widget.noti.notificationData.bigImage.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(BorderRadiusSize.medium),
              child: AspectRatio(
                aspectRatio: defaultImageAspectRatio,
                child: MtpImage(
                  widget.noti.notificationData.bigImage,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (widget.noti.notificationData.bigImage.isNotEmpty)
            const SizedBox(height: Grid.four),
          if (widget.noti.notificationData.clickActionLink.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: MtpPrimaryButton(
                labelText: context.l10n.notiButtonTextViewMore,
                onPressed: widget.noti.notificationData.clickAppLink.isEmpty
                    ? null
                    : () {
                        widget.onLaunchNotiEvent(
                            clickActionLink:
                                widget.noti.notificationData.clickAppLink);
                      },
              ),
            ),
          const SizedBox(height: Grid.two),
        ],
      ),
    );
  }
}
