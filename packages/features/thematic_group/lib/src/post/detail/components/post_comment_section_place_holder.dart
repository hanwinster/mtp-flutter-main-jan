import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class PostCommentSliverSectionPlaceholder extends StatelessWidget {
  const PostCommentSliverSectionPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: MtpShimmer(
        child: Column(
          children: [
            SizedBox(height: Grid.two),
            _CommentListItemPlaceholder(),
            SizedBox(height: Grid.two),
            _CommentListItemPlaceholder(),
            SizedBox(height: Grid.two),
            _CommentListItemPlaceholder(),
            SizedBox(height: Grid.two),
            _CommentListItemPlaceholder(),
          ],
        ),
      ),
    );
  }
}

class _CommentListItemPlaceholder extends StatelessWidget {
  const _CommentListItemPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShapePlaceholder(width: 48, height: 48, shape: BoxShape.circle),
        SizedBox(width: Grid.one),
        TextPlaceholder(line: 3, width: 100, height: 12),
      ],
    );
  }
}
