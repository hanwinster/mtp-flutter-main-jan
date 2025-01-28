import 'package:blog/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../../blog.dart';
import '../../bloc/post_details_bloc.dart';
import 'components.dart';

class PostListSliverHeader extends StatelessWidget {
  const PostListSliverHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      buildWhen: (previous, current) =>
          previous.selectedCategory != current.selectedCategory,
      builder: (context, state) {
        final title = state.selectedCategory == null
            ? context.l10n.blogLabelSubtitleRecommendedPosts
            : state.selectedCategory?.name ?? '';
        return SliverToBoxAdapter(child: SectionHeader(text: title));
      },
    );
  }
}

class PostListSliverSection extends StatelessWidget {
  const PostListSliverSection({
    super.key,
    required this.onPostTapped,
  });

  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      buildWhen: (previous, current) =>
          previous.filteredPostsUiState != current.filteredPostsUiState,
      builder: (context, state) {
        return state.filteredPostsUiState.toSliverView(
          context,
          loadingViewBuilder: () {
            return const PostListSliverSectionPlaceholder();
          },
          successViewBuilder: (items) {
            return SliverList.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: Grid.one),
                  child: PostListItem(
                    item: items[index],
                    onPostTapped: (item) => onPostTapped(item),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: items.length,
            );
          },
        );
      },
    );
  }
}
