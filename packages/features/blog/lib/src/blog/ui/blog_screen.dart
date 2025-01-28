import 'package:blog/src/blog/bloc/blog_bloc.dart';
import 'package:blog/src/blog/ui/components/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../blog.dart';
import '../../common/common.dart';
import '../bloc/bloc.dart';
import 'components/components.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({
    super.key,
    required this.onPostTapped,
    required this.scaffoldKey,
    required this.drawer,
    required this.onNotiClick,
  });

  final OnPostTapped onPostTapped;
  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final NotificationActionClickCallback onNotiClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer,
      appBar: buildMtpPrimaryAppBar(
        context,
        scaffoldKey,
        actions: [
          NotificationActionButton(
            onClicked: onNotiClick,
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: MtpOfflineIndicator(),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: Grid.two)),
            SliverToBoxAdapter(
              child: LatestPostsSection(
                onPostTapped: onPostTapped,
              ),
            ),
            const SliverSizedBox(height: Grid.two),
            const SliverToBoxAdapter(child: Divider())
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Grid.two),
            const _PostListSectionTitle(),
            const SizedBox(height: Grid.two),
            const _CategoryListSection(),
            const SizedBox(height: Grid.one),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Grid.two),
              child: const SearchInput(),
            ),
            const SizedBox(height: Grid.two),
            _FilteredPostListSection(
              onPostTapped: onPostTapped,
            ),
          ],
        ),
      ),
    );
  }
}

class _PostListSectionTitle extends StatelessWidget {
  const _PostListSectionTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      buildWhen: (previous, current) =>
          previous.filter.category != current.filter.category,
      builder: (context, state) {
        final title = state.filter.category == null
            ? context.l10n.blogLabelSubtitleRecommendedPosts
            : state.filter.category?.name ?? '';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.two),
          child: SectionHeader(
            text: title,
          ),
        );
      },
    );
  }
}

class _CategoryListSection extends StatelessWidget {
  const _CategoryListSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      buildWhen: (previous, current) =>
          previous.categoriesUiState != current.categoriesUiState,
      builder: (context, state) {
        return state.categoriesUiState.toView(
          context,
          successViewBuilder: (items) {
            return CategoryListView(
              items: items,
              onCategoryTapped: (item) {
                context.read<BlogBloc>().add(BlogPostCategoryToggled(item));
              },
              paddingStart: Grid.two,
              paddingEnd: Grid.two,
            );
          },
          loadingViewBuilder: (data) {
            return const CategoryListLoading();
          },
        );
      },
    );
  }
}

class _FilteredPostListSection extends StatelessWidget {
  const _FilteredPostListSection({
    required this.onPostTapped,
  });

  final OnPostTapped onPostTapped;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      buildWhen: (previous, current) =>
          previous.filter.category != current.filter.category ||
          previous.filteredPostsUiState != current.filteredPostsUiState,
      builder: (context, state) {
        final title = state.filter.category == null
            ? context.l10n.blogLabelSubtitleRecommendedPosts
            : state.filter.category?.name ?? '';
        return Expanded(
          child: PostListSection(
            title: title,
            itemsUiState: state.filteredPostsUiState,
            onPostTapped: onPostTapped,
          ),
        );
      },
    );
  }
}
