import 'package:base/base.dart';
import 'package:domain/domain.dart' hide Reaction;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ui/ui.dart';

import '../../bloc/post_details_bloc.dart';
import 'components.dart';

typedef OnReactionChanged = void Function({
  required ReactionType? oldReaction,
  required ReactionType newReaction,
});

class PostInteractionSection extends StatelessWidget {
  const PostInteractionSection({
    super.key,
    required this.currentReactionType,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.isShareable,
    required this.shareLink,
    required this.onReactionChanged,
  });

  final ReactionType? currentReactionType;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final bool isShareable;
  final String shareLink;
  final OnReactionChanged onReactionChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocListener<PostDetailsBloc, PostDetailsState>(
          listenWhen: (previous, current) =>
              previous.reactionSubmissionUiState !=
              current.reactionSubmissionUiState,
          listener: (context, state) {
            if (state.reactionSubmissionUiState is UiStateFailure) {
              showSnackBar(context,
                  state.reactionSubmissionUiState.messageOrEmpty(context));
            }
          },
          child: ReactionItem(
            likeCount: likeCount,
            userReaction: currentReactionType,
            onReactionChanged: onReactionChanged,
          ),
        ),
        _CommentItem(
          commentCount: commentCount,
        ),
        if (isShareable)
          _ShareItem(
            shareCount: shareCount,
            isShareable: isShareable,
            shareLink: shareLink,
          )
      ],
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({
    required this.commentCount,
  });

  final int commentCount;

  @override
  Widget build(BuildContext context) {
    return InteractionItem(
        icon: MtpAssets.images.thematicCommentIcon.image(
          width: 20,
          height: 20,
        ),
        text: context.l10n.postLabelCommentCount(commentCount));
  }
}

class _ShareItem extends StatelessWidget {
  const _ShareItem({
    required this.shareCount,
    required this.isShareable,
    required this.shareLink,
  });

  final int shareCount;
  final bool isShareable;
  final String shareLink;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (shareLink.isEmpty || !isShareable) {
          return;
        }

        try {
          final result = await Share.shareWithResult(shareLink);
          logger.d('Share result: ${result.status}');
          if (result.status == ShareResultStatus.success) {
            if (!context.mounted) return;

            context.read<PostDetailsBloc>().add(const PostDetailsPostShareTracked());
          }
        } catch (e, s) {
          logger.e('Error sharing post', e, s);
        }
      },
      child: InteractionItem(
        icon: MtpAssets.images.thematicShareIcon.image(
          width: 20,
          height: 20,
        ),
        text: context.l10n.postLabelShare(shareCount),
      ),
    );
  }
}
