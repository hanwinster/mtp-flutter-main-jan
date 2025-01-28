import 'package:blog/blog.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'post_components.dart';

class PostGridItem extends StatelessWidget {
  const PostGridItem({
    super.key,
    required this.item,
    required this.onPostTapped,
  });

  final BlogPost item;
  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth =
        context.breakpoints.smallerThan(TABLET) ? screenWidth * 0.8 : 320;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onPostTapped(item.id),
        child: SizedBox(
          width: itemWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Grid.two),
                  child: MtpImage(
                    item.imageUrl.large,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: Grid.one),
              PostTitle(title: item.title),
              const SizedBox(height: Grid.two),
              Row(
                mainAxisSize: MainAxisSize.max,
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
      ),
    );
  }
}
