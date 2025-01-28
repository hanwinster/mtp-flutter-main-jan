import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart'; // Import the package
import 'package:thematic_group/src/group_post_comment_list/group_post_comment_list.dart';
import 'package:thematic_group/src/post/detail/bloc/post_detail_bloc.dart';
import 'package:thematic_group/src/post/detail/post_detail_screen_entry.dart';
import 'package:ui/ui.dart';

import '../../group_post_comment_input/group_post_comment_input.dart';
import 'components/components.dart';
import 'components/sliver_post_item.dart';

class PostDetailScreen extends StatelessWidget {
  final String postId;
  final String groupId;
  final OnPostDetailEditTapped onPostDetailEditTapped;

  const PostDetailScreen({
    super.key,
    required this.postId,
    required this.groupId,
    required this.onPostDetailEditTapped,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize a RefreshController
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(),
          const SliverAppBar(
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<PostDetailBloc, PostDetailState>(
                buildWhen: (previous, current) =>
                    previous.postUiState != current.postUiState,
                builder: (context, state) {
                  return state.postUiState.toView(
                    context,
                    successViewBuilder: (post) {
                      return Sliverpostitem(
                        controller: refreshController,
                        onPostDetailEditTapped: onPostDetailEditTapped,
                        post: post,
                      );
                    },
                    onRetried: () {
                      context.read<PostDetailBloc>().add(PostDetailFetched());
                    },
                  );
                },
              ),
            ),
          ),
          const SliverSizedBox(
            height: Grid.two,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Grid.two),
            sliver: SliverToBoxAdapter(
              child: CommentBox(
                onTap: () {
                  _showCommentDialog(context, postId);
                },
              ),
            ),
          ),
          BlocBuilder<GroupPostCommentListBloc, GroupPostCommentListState>(
            buildWhen: (previous, current) =>
                previous.commentsUiState != current.commentsUiState,
            builder: (context, state) {
              return state.commentsUiState.toSliverView(
                context,
                successViewBuilder: (comments) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: Grid.two),
                    sliver: GroupPostCommentSliverList(comments: comments),
                  );
                },
              );
            },
          ),
          const SliverSizedBox(
            height: 72,
          ),
        ],
      ),
    );
  }

  Future<void> _showCommentDialog(
    BuildContext context,
    String postId,
  ) async {
    final result = await showDialog<ThematicGroupPostComment?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: PostCommentInputEntry(
            postId: postId,
            replyToComment: null,
          ),
        );
      },
    );
    if (result != null && context.mounted) {
      context.read<GroupPostCommentListBloc>().add(
            GroupPostCommentAdded(result),
          );
    }
  }
}
