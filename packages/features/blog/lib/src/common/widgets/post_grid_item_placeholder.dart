import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class PostGridItemPlaceholder extends StatelessWidget {
  const PostGridItemPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth =
        context.breakpoints.smallerThan(TABLET) ? screenWidth * 0.8 : 320;
    return SizedBox(
      width: itemWidth,
      child: MtpShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: RectanglePlaceholder(
                width: double.infinity,
                height: double.infinity,
                borderRadius: BorderRadius.circular(Grid.two),
              ),
            ),
            const SizedBox(height: Grid.one),
            const TextPlaceholder(
              line: 1,
              height: 18,
            ),
            const SizedBox(height: Grid.one),
            const Row(
              children: [
                TextPlaceholder(line: 1, width: 100, height: 16),
                Spacer(),
                TextPlaceholder(line: 1, width: 56, height: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
