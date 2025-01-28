import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../../common/widgets/post_list_item_placeholder.dart';

class PostListSliverSectionPlaceholder extends StatelessWidget {
  const PostListSliverSectionPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const SliverToBoxAdapter(
      child: MtpShimmer(
        child: Column(
          children: [
            SizedBox(height: Grid.two),
            PostListItemPlaceholder(),
            SizedBox(height: Grid.two),
            PostListItemPlaceholder(),
            SizedBox(height: Grid.two),
            PostListItemPlaceholder(),
            SizedBox(height: Grid.two),
            PostListItemPlaceholder(),
          ],
        ),
      ),
    );
  }
}
