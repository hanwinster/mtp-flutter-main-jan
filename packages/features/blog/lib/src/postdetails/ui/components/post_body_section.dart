import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class PostBodySection extends StatelessWidget {
  const PostBodySection({
    super.key,
    required this.post,
  });

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PostCategory(
          category: post.categories.firstOrNull?.name ?? '',
        ),
        const SizedBox(height: Grid.two),
        _PostTitle(title: post.title),
        const SizedBox(height: Grid.two),
        _PostContent(
          bodyUpper: post.bodyUpper,
          blockQuote: post.blockQuote,
          bodyLower: post.bodyLower,
        ),
      ],
    );
  }
}

class _PostCategory extends StatelessWidget {
  const _PostCategory({
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    if (category.isEmpty) return const SizedBox();

    return Row(
      children: [
        MtpAssets.icons.postCategory2.image(
          width: 20,
          height: 20,
        ),
        const SizedBox(width: Grid.one),
        Expanded(
          child: Text(
            category,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _PostTitle extends StatelessWidget {
  const _PostTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge,
    );
  }
}

class _PostContent extends StatelessWidget {
  const _PostContent({
    required this.bodyUpper,
    required this.blockQuote,
    required this.bodyLower,
  });

  final String bodyUpper;
  final String blockQuote;
  final String bodyLower;

  @override
  Widget build(BuildContext context) {
    String content = "";
    if (bodyUpper.isNotEmpty) content += bodyUpper;
    if (blockQuote.isNotEmpty) {
      content += '<blockquote>$blockQuote</blockquote>';
    }
    if (bodyLower.isNotEmpty) content += bodyLower;
    return MtpHtml(
      content,
      textStyle: context.textTheme.bodyLarge,
    );
  }
}
