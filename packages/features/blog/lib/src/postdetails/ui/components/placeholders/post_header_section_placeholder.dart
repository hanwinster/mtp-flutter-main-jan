import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui/ui.dart';

class PostHeaderSectionPlaceholder extends StatelessWidget {
  const PostHeaderSectionPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MtpShimmer(
      child: Column(
        children: [
          const _AuthorInfoPlaceholder(),
          const SizedBox(height: Grid.two),
          RectanglePlaceholder(
            width: double.infinity,
            height: 200,
            borderRadius: BorderRadius.circular(Grid.two),
          ),
          const SizedBox(height: Grid.one),
          const _PostInfoPlaceholder(),
        ],
      ),
    );
  }
}

class _AuthorInfoPlaceholder extends StatelessWidget {
  const _AuthorInfoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ShapePlaceholder(
          shape: BoxShape.circle,
          width: 25,
          height: 25,
        ),
        SizedBox(width: Grid.one),
        TextPlaceholder(line: 1, width: 56, height: 14),
      ],
    );
  }
}

class _PostInfoPlaceholder extends StatelessWidget {
  const _PostInfoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextPlaceholder(line: 1, width: 56, height: 14),
        TextPlaceholder(line: 1, width: 56, height: 14),
      ],
    );
  }
}
