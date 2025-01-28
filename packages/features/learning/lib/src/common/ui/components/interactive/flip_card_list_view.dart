import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class FlipCardListView extends StatelessWidget {
  const FlipCardListView({
    super.key,
    required this.items,
  });

  final List<InteractiveFlipCard> items;

  Widget _buildFlipCard(BuildContext context, InteractiveFlipCard item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Grid.two),
      child: FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        front: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                border: Border.all(
                  color: context.colorScheme.outline.withOpacity(0.12),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(Grid.two),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Grid.two + Grid.one),
                    topRight: Radius.circular(Grid.two + Grid.one),
                    bottomLeft: Radius.circular(Grid.two),
                    bottomRight: Radius.circular(Grid.two),
                  ),
                ),
                margin: const EdgeInsets.only(top: Grid.one),
                child: Padding(
                  padding: const EdgeInsets.all(Grid.two),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (item.frontTitle.isNotEmpty) ...[
                        Text(
                          item.frontTitle,
                          style: context.textTheme.titleSmall,
                        ),
                      ],
                      if (item.frontDescription.isNotEmpty) ...[
                        const SizedBox(height: Grid.two),
                        Text(
                          item.frontDescription,
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                      if (item.frontImageUrl.isNotEmpty) ...[
                        const SizedBox(height: Grid.two),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Grid.two),
                          child: AspectRatio(
                            aspectRatio: defaultImageAspectRatio,
                            child: MtpImage(
                              item.frontImageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Grid.one,
              right: Grid.one,
              child: Icon(
                Icons.autorenew,
                color: context.colorScheme.iconDisabled,
              ),
            ),
          ],
        ),
        back: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            border: Border.all(
              color: context.colorScheme.outline,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Grid.two),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Grid.two),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (item.backTitle.isNotEmpty) ...[
                  Text(
                    item.backTitle,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
                if (item.backDescription.isNotEmpty) ...[
                  const SizedBox(height: Grid.two),
                  Text(
                    item.backDescription,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
                if (item.backImageUrl.isNotEmpty) ...[
                  const SizedBox(height: Grid.two),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Grid.two),
                      child: AspectRatio(
                        aspectRatio: defaultImageAspectRatio,
                        child: MtpImage(
                          item.backImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (index, item) in items.indexed) ...[
          if (index > 0) const SizedBox(height: Grid.one),
          _buildFlipCard(context, item),
        ],
      ],
    );
  }
}
