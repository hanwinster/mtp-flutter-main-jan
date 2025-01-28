import 'package:blog/blog.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../bloc/post_details_bloc.dart';
import 'components/components.dart';

class PostDetailsSliverContent extends StatelessWidget {
  const PostDetailsSliverContent({
    super.key,
    required this.onPostTapped,
    required this.onTagTapped,
  });

  final PostTapCallback onPostTapped;
  final PostTagTapCallback onTagTapped;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<PostDetailsBloc, PostDetailsState>(
        buildWhen: (previous, current) =>
            previous.postUiState != current.postUiState,
        builder: (context, state) {
          return state.postUiState.toView(
            context,
            showCachedData: true,
            successViewBuilder: (post) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeaderSection(post: post),
                  const SizedBox(height: Grid.two),
                  PostBodySection(post: post),
                  const SizedBox(height: Grid.two),
                  PostInteractionSection(
                    likeCount: post.numberOfReactions,
                    currentReactionType: post.currentReaction?.reactionType,
                    commentCount: post.numberOfComments,
                    shareCount: post.shareCount,
                    isShareable: true,
                    shareLink: post.shareLink,
                    onReactionChanged: ({
                      required ReactionType? oldReaction,
                      required ReactionType newReaction,
                    }) {
                      context.read<PostDetailsBloc>().add(
                            PostDetailsPostReactionChanged(
                              oldReaction: oldReaction,
                              newReaction: newReaction,
                            ),
                          );
                    },
                  ),
                ],
              );
            },
            loadingViewBuilder: (data) {
              return const Column(
                children: [
                  PostHeaderSectionPlaceholder(),
                  SizedBox(height: Grid.two),
                  PostBodySectionPlaceholder(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
