import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CourseListItemView extends StatelessWidget {
  const CourseListItemView({
    super.key,
    required this.index,
    required this.item,
    required this.onTap,
  });

  final int index;
  final Course item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: context.colorScheme.surfaceContainerLowest,
        child: InkWell(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Grid.one,
              vertical: Grid.one,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Grid.one),
                    child: AspectRatio(
                      aspectRatio: defaultImageAspectRatio,
                      child: MtpImage(
                        item.coverImage.thumbnail,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Grid.two),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MtpHtmlPlainText(
                        item.title,
                        textStyle: context.textTheme.titleSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: Grid.half),
                      Text(
                        item.categories.firstOrNull?.name ?? '',
                        style: context.textTheme.labelMedium,
                      ),
                      const SizedBox(height: Grid.one),
                      Text(
                        item.courseLevel.value,
                        style: context.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
