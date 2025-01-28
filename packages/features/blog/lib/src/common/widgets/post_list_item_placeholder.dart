import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui/ui.dart';

class PostListItemPlaceholder extends StatelessWidget {
  const PostListItemPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MtpShimmer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          RectanglePlaceholder(
            width: 88,
            height: 88,
            borderRadius: BorderRadius.circular(Grid.two),
          ),
          const SizedBox(width: Grid.two),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Grid.half),
                TextPlaceholder(
                  line: 2,
                  height: 18,
                ),
                SizedBox(height: Grid.two),
                Row(
                  children: [
                    TextPlaceholder(line: 1, width: 100, height: 16),
                    SizedBox(width: Grid.half),
                    TextPlaceholder(line: 1, width: 56, height: 14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
