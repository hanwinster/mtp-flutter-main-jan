import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class CategoriesSliverSectionPlaceholder extends StatelessWidget {
  const CategoriesSliverSectionPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MtpShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextPlaceholder(
              line: 1,
              width: 100,
              height: 20,
            ),
            const SizedBox(height: Grid.two),
            Row(
              children: [
                RectanglePlaceholder(
                  width: 100,
                  height: 16,
                  borderRadius: BorderRadius.circular(Grid.one),
                ),
                const SizedBox(width: Grid.one),
                RectanglePlaceholder(
                  width: 100,
                  height: 16,
                  borderRadius: BorderRadius.circular(Grid.one),
                ),
                const SizedBox(width: Grid.one),
                RectanglePlaceholder(
                  width: 100,
                  height: 16,
                  borderRadius: BorderRadius.circular(Grid.one),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
