import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ImageTextListView extends StatelessWidget {
  const ImageTextListView({super.key, required this.items});

  final List<InteractiveImageText> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (index, item) in items.indexed) ...[
            if (index > 0) const SizedBox(height: Grid.two),
            if (item.title.isNotEmpty)
              Text(
                item.title,
                style: context.textTheme.titleMedium,
              ),
            if (item.imageUrl.isNotEmpty) ...[
              const SizedBox(height: Grid.two),
              AspectRatio(
                aspectRatio: defaultImageAspectRatio,
                child: MtpImage(
                  item.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            if (item.description.isNotEmpty) ...[
              const SizedBox(height: Grid.two),
              Text(
                item.description,
                style: context.textTheme.bodyLarge,
              ),
            ],
          ],
        ],
      ),
    );
  }
}
