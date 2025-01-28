import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../models/models.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  final SelectableCategoryItemState item;
  final Function(SelectableCategoryItemState) onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1,
      end: 0.97,
      onTap: () => onTap(item),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.one,
          vertical: Grid.one,
        ),
        decoration: BoxDecoration(
          color: item.isSelected
              ? context.colorScheme.primary
              : context.colorScheme.categoryBackgroundColor,
          borderRadius: BorderRadius.circular(Grid.two),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MtpAssets.icons.postCategory.image(width: 20, height: 20),
            const SizedBox(width: Grid.one),
            Text(
              item.category.name,
              style: context.textTheme.bodyMedium?.copyWith(
                color: item.isSelected
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: Grid.one),
          ],
        ),
      ),
    );
  }
}
