import 'package:base/base.dart';
import 'package:blog/src/postdetails/models/models.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';
import 'package:ui/ui.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../postcomment/post_comment.dart';
import '../../bloc/post_details_bloc.dart';
import 'components.dart';

const mediaThumbnailSize = 200.0;

class PostCommentSliverSection extends StatefulWidget {
  const PostCommentSliverSection({
    super.key,
  });

  @override
  State<PostCommentSliverSection> createState() =>
      _PostCommentSliverSectionState();
}

class _PostCommentSliverSectionState extends State<PostCommentSliverSection> {
  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('my', MyMessages());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      buildWhen: (previous, current) =>
          previous.commentsUiState != current.commentsUiState,
      builder: (context, state) {
        return state.commentsUiState.toSliverView(
          context,
          emptyViewBuilder: (message) {
            return const _EmptySliverList();
          },
          loadingViewBuilder: () {
            return const PostCommentSliverSectionPlaceholder();
          },
          successViewBuilder: (comments) {
            return _CommentSliverList(comments: comments);
          },
        );
      },
    );
  }
}

class _EmptySliverList extends StatelessWidget {
  const _EmptySliverList();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: Grid.four),
          const _CommentInput(),
        ],
      ),
    );
  }
}

class _CommentSliverList extends StatelessWidget {
  const _CommentSliverList({
    required this.comments,
  });

  final List<UiPostCommentItem> comments;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: Grid.four),
          const _CommentInput(),
          const SizedBox(height: Grid.two),
          Text(
            context.l10n.postLabelSubtitleComments,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Grid.two),
          ...(comments.mapIndexed((index, item) {
            if (index > 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Grid.two),
                  _CommentListItem(item: item),
                ],
              );
            }
            return _CommentListItem(item: item);
          }).toList())
        ],
      ),
    );
  }
}

class _CommentInput extends StatelessWidget {
  const _CommentInput();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _showCommentDialog(context);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surfaceContainerHighest,
            ),
            child: Padding(
              padding: const EdgeInsets.all(Grid.one),
              child: Icon(Icons.image,
                  color: context.colorScheme.onSurfaceVariant),
            ),
          ),
        ),
        const SizedBox(width: Grid.one),
        Expanded(
          child: MtpOutlinedButton(
            onPressed: () {
              _showCommentDialog(context);
            },
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.postLabelPlaceholderComment,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _CommentListItem extends StatelessWidget {
  const _CommentListItem({
    required this.item,
  });

  final UiPostCommentItem item;

  @override
  Widget build(BuildContext context) {
    final comment = item.comment;
    return GestureDetector(
      onLongPressStart: item.isOwner
          ? (details) async {
              await _showPopupMenu(context, details.globalPosition);
            }
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MtpCircleImage(
            comment.user?.avatar ?? '',
            width: 48,
            height: 48,
          ),
          const SizedBox(width: Grid.one),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Grid.two),
                    color: context.colorScheme.surfaceContainerHighest,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Grid.two,
                      vertical: Grid.one,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (comment.user?.fullName ?? '').maskName,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        ReadMoreText(
                          comment.text,
                          trimMode: TrimMode.Line,
                          colorClickableText: context.colorScheme.primary,
                          trimLines: 3,
                          trimCollapsedText: context.l10n.postLabelReadMore,
                          trimExpandedText: context.l10n.postLabelReadLess,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (comment.imageUrl.isNotEmpty) ...[
                  const SizedBox(height: Grid.one),
                  InkWell(
                    child: SizedBox(
                      width: mediaThumbnailSize,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: MtpImage(
                          comment.imageUrl,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MtpImageViewer(
                            imageUrl: comment.imageUrl,
                            heroTag: comment.imageUrl,
                          ),
                        ),
                      );
                    },
                  )
                ],
                if (comment.videoUrl.isNotEmpty) ...[
                  const SizedBox(height: Grid.one),
                  SizedBox(
                    width: mediaThumbnailSize,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: _CommentVideo(
                        videoUrl: comment.videoUrl,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: Grid.one),
                Padding(
                  padding: const EdgeInsets.only(left: Grid.one),
                  child: Row(
                    children: [
                      Text(
                        timeago.format(
                          comment.createdAt,
                          locale: context.locale,
                        ),
                        style: context.textTheme.labelSmall,
                      ),
                      const SizedBox(width: Grid.one),
                      Text(
                        '•',
                        style: context.textTheme.labelSmall?.copyWith(
                          color:
                              context.colorScheme.onSurface.withOpacity(0.36),
                        ),
                      ),
                      const SizedBox(width: Grid.one),
                      ReactionItem(
                        likeCount: comment.numberOfReactions,
                        userReaction: comment.currentReaction?.reactionType,
                        onReactionChanged: ({
                          required ReactionType? oldReaction,
                          required ReactionType newReaction,
                        }) {
                          context.read<PostDetailsBloc>().add(
                                PostDetailsCommentReactionChanged(
                                  commentId: comment.id,
                                  currentReaction: comment.currentReaction,
                                  newReactionType: newReaction,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showPopupMenu(BuildContext context, Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    const editItemValue = 'edit';
    const deleteItemValue = 'delete';

    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, left, top),
      items: [
        PopupMenuItem(
          value: editItemValue,
          child: Text(context.l10n.postButtonTextEditComment),
        ),
        PopupMenuItem(
          value: deleteItemValue,
          child: Text(context.l10n.postButtonTextDeleteComment),
        ),
      ],
      elevation: 8.0,
    );

    if (result == editItemValue) {
      if (!context.mounted) return;

      _showCommentDialog(
        context,
        comment: item.comment,
      );
    } else if (result == deleteItemValue) {
      if (!context.mounted) return;

      context.read<PostDetailsBloc>().add(
            PostDetailsCommentDeleted(item.comment.id),
          );
    }
  }
}

class _CommentVideo extends StatefulWidget {
  const _CommentVideo({
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<_CommentVideo> createState() => _CommentVideoState();
}

class _CommentVideoState extends State<_CommentVideo> {
  String thumbnailUrl = '';

  @override
  void initState() {
    _processVideoUrl(widget.videoUrl);
    super.initState();
  }

  void _processVideoUrl(String videoUrl) async {
    if (!isYoutubeVideo(widget.videoUrl)) {
      await _fetchVideoThumbnail(videoUrl);
    } else {
      await _fetchYoutubeThumbnail(videoUrl);
    }
  }

  Future<void> _fetchVideoThumbnail(String videoUrl) async {
    final url = await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 200,
      quality: 75,
    );
    setState(() {
      thumbnailUrl = url ?? "";
    });
  }

  Future<void> _fetchYoutubeThumbnail(String videoUrl) async {
    final youtubeId = YoutubePlayer.convertUrlToId(videoUrl) ?? "";
    final url = YoutubeThumbnail(youtubeId: youtubeId).standard();
    setState(() {
      thumbnailUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (thumbnailUrl.isEmpty) {
      return _CommentVideoThumbnail(
        imageUrl: '',
        onTapped: () {},
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        _CommentVideoThumbnail(
          imageUrl: thumbnailUrl,
          onTapped: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MtpVideoFullScreenPlayer(
                  videoUrl: widget.videoUrl,
                ),
              ),
            );
          },
        ),
        _VideoPlayButton(
          videoUrl: widget.videoUrl,
        ),
      ],
    );
  }
}

class _VideoPlayButton extends StatelessWidget {
  const _VideoPlayButton({required this.videoUrl});

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  MtpVideoFullScreenPlayer(videoUrl: videoUrl),
            ),
          );
        },
        child: Icon(
          Icons.play_circle_fill,
          color: context.colorScheme.onPrimary,
          size: 48,
        ),
      ),
    );
  }
}

class _CommentVideoThumbnail extends StatelessWidget {
  const _CommentVideoThumbnail({
    required this.imageUrl,
    required this.onTapped,
  });

  final String imageUrl;
  final Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: ZoomTapAnimation(
        onTap: () => onTapped(),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(BorderRadiusSize.normal),
            child: MtpImage(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

void _showCommentDialog(
  BuildContext context, {
  BlogPostComment? comment,
}) {
  final postId = context.read<PostDetailsBloc>().state.postId;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: PostCommentInputEntry(
          postId: postId,
          comment: comment,
        ),
      );
    },
  );
}
