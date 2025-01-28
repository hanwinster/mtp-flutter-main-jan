import 'package:blog/blog.dart';
import 'package:blog/src/common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui/ui.dart';

import 'post_list_item_placeholder.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
    required this.items,
    required this.onPostTapped,
  });

  final List<BlogPost> items;
  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount =
        context.breakpoints.largerOrEqualTo(WindowSizeClass.large.name) ? 2 : 1;

    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return AlignedGridView.count(
      padding: const EdgeInsets.only(
        left: Grid.two,
        right: Grid.two,
        bottom: Grid.two,
      ),
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      itemCount: items.length,
      mainAxisSpacing: Grid.two,
      crossAxisSpacing: Grid.two,
      itemBuilder: (context, index) {
        return PostListItem(
          item: items[index],
          onPostTapped: onPostTapped,
        );
      },
    );
  }
}

class PostListLoading extends StatelessWidget {
  const PostListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const itemCount = 10;
    final crossAxisCount =
        context.breakpoints.largerOrEqualTo(WindowSizeClass.large.name) ? 2 : 1;
    return AlignedGridView.count(
      padding: const EdgeInsets.only(
        left: Grid.two,
        right: Grid.two,
        bottom: Grid.two,
      ),
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      itemCount: itemCount,
      mainAxisSpacing: Grid.two,
      crossAxisSpacing: Grid.two,
      itemBuilder: (context, index) {
        return const PostListItemPlaceholder();
      },
    );
  }
}
