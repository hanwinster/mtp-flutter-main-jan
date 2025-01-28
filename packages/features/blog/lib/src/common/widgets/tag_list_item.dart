import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class TagListItem extends StatelessWidget {
  const TagListItem({
    super.key,
    required this.item,
    required this.onTapped,
  });

  final BlogPostTag item;
  final Function(BlogPostTag) onTapped;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: 0.97,
      onTap: () => onTapped(item),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.one,
          vertical: Grid.one,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.categoryBackgroundColor,
          borderRadius: BorderRadius.circular(Grid.one),
        ),
        child: Text(
          item.name,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
