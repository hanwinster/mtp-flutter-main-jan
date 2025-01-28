import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class PostBodySectionPlaceholder extends StatelessWidget {
  const PostBodySectionPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MtpShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostCategoryPlaceholder(),
          SizedBox(height: Grid.two),
          _PostTitlePlaceholder(),
          SizedBox(height: Grid.two),
          _PostContentPlaceholder(),
        ],
      ),
    );
  }
}

class _PostCategoryPlaceholder extends StatelessWidget {
  const _PostCategoryPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ShapePlaceholder(width: 16, height: 16, shape: BoxShape.circle),
        SizedBox(width: Grid.one),
        TextPlaceholder(
          line: 1,
          width: 56,
          height: 12,
        ),
      ],
    );
  }
}

class _PostTitlePlaceholder extends StatelessWidget {
  const _PostTitlePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const TextPlaceholder(
      line: 1,
      width: double.infinity,
      height: 24,
    );
  }
}

class _PostContentPlaceholder extends StatelessWidget {
  const _PostContentPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const TextPlaceholder(
      line: 10,
      width: double.infinity,
      height: 16,
    );
  }
}
