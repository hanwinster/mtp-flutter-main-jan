import 'package:base/base.dart';
import 'package:blog/blog.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'post_components.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    super.key,
    required this.item,
    required this.onPostTapped,
  });

  final BlogPost item;
  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onPostTapped(item.id),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 88,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Grid.one),
                child: AspectRatio(
                  aspectRatio: defaultImageAspectRatio,
                  child: MtpImage(
                    item.imageUrl.medium,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(width: Grid.two),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PostTitle(title: item.title),
                  const SizedBox(height: Grid.one),
                  Row(
                    children: [
                      Expanded(
                        child: PostAuthor(
                          authorName: item.author?.fullName ?? '',
                          authorProfileImageUrl:
                              item.author?.profileImageUrl?.thumbnail ?? '',
                        ),
                      ),
                      const SizedBox(width: Grid.half),
                      PostDate(date: item.createdAt),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
