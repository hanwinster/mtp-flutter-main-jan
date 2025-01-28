import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ShareSomethingCard extends StatelessWidget {
  const ShareSomethingCard({
    super.key,
    required this.onUserProfilePressed,
    required this.onCardPressed,
  });

  final Function() onUserProfilePressed;
  final Function() onCardPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          // horizontal: Grid.one,
          vertical: Grid.one,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Avatar(
                  onTap: onUserProfilePressed,
                ),
                const SizedBox(width: Grid.one),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: Grid.two),
                    decoration: BoxDecoration(
                      color: context.colorScheme.outline.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.l10n.groupLabelShareSomething,
                        style: context.textTheme.bodyMedium?.copyWith(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Grid.two),
            Padding(
              padding: const EdgeInsets.only(
                left: 36 + Grid.one,
                right: Grid.one,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _IconWithText(
                    icon: Icons.edit,
                    text: context.l10n.groupLabelPost,
                  ),
                  _IconWithText(
                    icon: Icons.image_outlined,
                    text: context.l10n.groupLabelPhoto,
                  ),
                  _IconWithText(
                    icon: Icons.video_camera_back_outlined,
                    text: context.l10n.groupLabelVideo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const MtpCircleImage(
        '',
        width: 36,
        height: 36,
      ),
    );
  }
}

class _IconWithText extends StatelessWidget {
  const _IconWithText({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: context.colorScheme.iconDisabled,
        ),
        const SizedBox(
          width: Grid.one,
        ),
        Text(
          text,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.textMediumEmphasis,
          ),
        ),
      ],
    );
  }
}
