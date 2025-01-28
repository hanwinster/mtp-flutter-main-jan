import 'package:base/base.dart';
import 'package:blog/blog.dart';
import 'package:blog/src/common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class LatestPostsSection extends StatelessWidget {
  const LatestPostsSection({
    super.key,
    required this.onPostTapped,
  });

  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          child: SectionHeader(
            text: context.l10n.blogLabelSubtitleLatestPosts,
          ),
        ),
        const SizedBox(height: Grid.two),
        BlocBuilder<BlogBloc, BlogState>(
          buildWhen: (previous, current) =>
              previous.latestPostsUiState != current.latestPostsUiState,
          builder: (context, state) {
            return state.latestPostsUiState.toView(
              context,
              successViewBuilder: (items) {
                return _LatestPostsList(
                  items: items,
                  onPostTapped: onPostTapped,
                );
              },
              loadingViewBuilder: (items) {
                return const _LatestPostsLoading();
              },
              onRetried: () {
                context.read<BlogBloc>().add(const BlogLatestPostsFetched());
              },
              showCachedData: true,
            );
          },
        )
      ],
    );
  }
}

class _LatestPostsList extends StatelessWidget {
  const _LatestPostsList({
    required this.items,
    required this.onPostTapped,
  });

  final List<BlogPost> items;
  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    final length = items.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.mapIndexed((index, item) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? Grid.two : Grid.two,
                  right: index == length - 1 ? Grid.two : Grid.zero,
                ),
                child: PostGridItem(
                  item: item,
                  onPostTapped: onPostTapped,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _LatestPostsLoading extends StatelessWidget {
  const _LatestPostsLoading();

  @override
  Widget build(BuildContext context) {
    const length = 5;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<int>.generate(length, (index) => index).map((index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? Grid.two : Grid.two,
                  right: index == length - 1 ? Grid.two : Grid.zero,
                ),
                child: const PostGridItemPlaceholder(),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
