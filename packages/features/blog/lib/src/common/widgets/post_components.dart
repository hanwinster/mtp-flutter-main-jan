import 'package:blog/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodyLarge?.copyWith(height: 1.4),
    );
  }
}

class PostAuthor extends StatelessWidget {
  const PostAuthor({
    super.key,
    required this.authorProfileImageUrl,
    required this.authorName,
  });

  final String authorProfileImageUrl;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        AuthorIcon(url: authorProfileImageUrl),
        const SizedBox(width: Grid.half),
        Expanded(
          child: Text(
            authorName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class PostDate extends StatelessWidget {
  const PostDate({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date.asString(context),
      maxLines: 1,
      textAlign: TextAlign.end,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodySmall,
    );
  }
}
