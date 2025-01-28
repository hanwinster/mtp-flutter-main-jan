import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thematic_group/src/post/post_edit/bloc/post_edit_bloc.dart';
import 'package:ui/ui.dart';
import '../bloc/posts_bloc.dart';
import '../../group/group_feed/group_feed_screen_entry.dart';
import 'post_item.dart';

class PostListView extends StatefulWidget {
  final String groupId;
  final OnPostTapped onPostTapped;
  final OnPostEditTapped onPostEditTapped;

  const PostListView({
    super.key,
    required this.groupId,
    required this.onPostTapped,
    required this.onPostEditTapped,
  });

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  final RefreshController _refreshController = RefreshController();
  final PagingController<int, ThematicGroupPost> _pagingController =
      PagingController(firstPageKey: 1);
  late StreamSubscription _postUpdateSubscription;

  @override
  void initState() {
    super.initState();
    _setupPostUpdateListener();
  }

  void _setupPostUpdateListener() {
    _postUpdateSubscription = PostUpdateService().postUpdates.listen((update) {
      // Refresh the list to get the latest data
      _onRefresh();

      // Optionally update the UI immediately while waiting for refresh
      final currentItems = _pagingController.itemList ?? [];
      final updatedItems = currentItems.map((post) {
        return post;
      }).toList();

      if (_pagingController.value.status == PagingStatus.completed) {
        _pagingController.itemList = updatedItems;
      }
    });
  }

  @override
  void dispose() {
    _postUpdateSubscription.cancel();
    _pagingController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    _refreshController.requestRefresh();
    _pagingController.refresh();
    // Trigger the event again to fetch posts
    context
        .read<PostsBloc>()
        .add(PostsFetched(groupId: widget.groupId, pageSize: 15));
    _refreshController.refreshCompleted();
  }

  void _handlePostDelete(String postID) {
    // Clear the paging controller
    _pagingController.itemList = [];
    _pagingController.nextPageKey = 1;
    context
        .read<PostsBloc>()
        .add(PostGPDelete(postId: postID, groupId: widget.groupId));
    Future.delayed(const Duration(milliseconds: 1000), () {
      _onRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsBloc, PostsState>(
      listener: (context, state) {
        if (state.postsUiState is UiStateFailure) {
          _pagingController.error = 'Failed to load posts';
        } else if (state.postsUiState is UiStateSuccess) {
          final isLastPage = state.hasReachedMax;

          // Get the current list of items from the PagingController
          final currentItems = _pagingController.itemList ?? [];

          // Create a Set of existing IDs to efficiently filter new posts
          final existingPostIds = currentItems.map((post) => post.id).toSet();
          final newPosts = state.posts
              .where((post) => !existingPostIds.contains(post.id))
              .toList()
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
          if (newPosts.isNotEmpty) {
            if (isLastPage) {
              _pagingController.appendLastPage(currentItems + newPosts);
            } else {
              final nextPageKey = state.page + 1;
              _pagingController.appendPage(
                  currentItems + newPosts, nextPageKey);
            }
          } else if (isLastPage) {
            // If it's the last page and no new items, just append the current items
            _pagingController.appendLastPage(currentItems);
          }
        }
      },
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: PagedListView<int, ThematicGroupPost>.separated(
          padding: const EdgeInsets.only(
            top: Grid.one,
            bottom: Grid.two,
          ),
          separatorBuilder: (context, index) =>
              const SizedBox(height: Grid.one),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<ThematicGroupPost>(
            itemBuilder: (context, post, index) => PostItem(
              post: post,
              onPostTapped: widget.onPostTapped,
              controller: _refreshController,
              onPostEditTapped: widget.onPostEditTapped,
              onPostDelteTapped: (postID) {
                _handlePostDelete(postID);
              },
            ),
            noItemsFoundIndicatorBuilder: (context) =>
                Center(child: Text(context.l10n.groupLabelEmptyPost)),
            firstPageProgressIndicatorBuilder: (context) =>
                const Center(child: CircularProgressIndicator()),
            newPageProgressIndicatorBuilder: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
