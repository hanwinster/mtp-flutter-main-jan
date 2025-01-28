import 'package:blog/blog.dart';
import 'package:blog/src/postdetails/ui/components/post_comment_section.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'components/components.dart';
import 'post_details_content.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({
    super.key,
    required this.onPostTapped,
    required this.onTagTapped,
    required this.onTakeQuizTapped,
  });

  final PostTapCallback onPostTapped;
  final PostTagTapCallback onTagTapped;
  final TakeQuizTapCallback onTakeQuizTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
          ),
          const SliverToBoxAdapter(
            child: MtpOfflineIndicator(),
          ),
          const SliverToBoxAdapter(
            child: PostLoadingIndicator(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: PostDetailsSliverContent(
              onPostTapped: onPostTapped,
              onTagTapped: onTagTapped,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: PostCommentSliverSection(),
          ),
          const SliverSizedBox(height: Grid.four),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: SliverToBoxAdapter(
              child: PostMarkAsReadSection(
                onTakeQuizTapped: onTakeQuizTapped,
              ),
            ),
          ),
          const SliverSizedBox(height: Grid.two),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: PostTagsSliverSection(
              onTagTapped: (tag) => onTagTapped(tag),
            ),
          ),
          const SliverSizedBox(height: Grid.two),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: CategoriesSliverSection(),
          ),
          const SliverSizedBox(height: Grid.two),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: PostListSliverHeader(),
          ),
          const SliverSizedBox(height: Grid.one),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: PostListSliverSection(onPostTapped: (item) {
              onPostTapped(item);
            }),
          ),
        ],
      ),
    );
  }
}
