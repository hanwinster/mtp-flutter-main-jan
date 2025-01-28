import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:thematic_group/src/group_post_comment_list/bloc/bloc.dart';
import 'package:thematic_group/src/group_post_comment_list/ui/components/components.dart';
import 'package:ui/ui.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../common/interaction/interaction.dart';
import '../../../group_post_comment_input/group_post_comment_input.dart';

const mediaThumbnailSize = 200.0;

class GroupPostCommentCard extends StatelessWidget {
  const GroupPostCommentCard({
    super.key,
    required this.user,
    required this.text,
    required this.imageUrl,
    required this.videoUrl,
    required this.isOwner,
    required this.numberOfReactions,
    required this.userReaction,
    required this.createdAt,
    required this.onReactionChanged,
    required this.onReply,
    required this.onEdit,
    required this.onDelete,
  });

  final User user;
  final String text;
  final String imageUrl;
  final String videoUrl;
  final bool isOwner;
  final int numberOfReactions;
  final Reaction? userReaction;
  final DateTime createdAt;
  final OnReactionChanged onReactionChanged;
  final Function() onReply;
  final Function() onEdit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: null,
      // isOwner
      //     ? (details) async {
      //         await _showPopupMenu(context, details.globalPosition);
      //       }
      //     : null,
      child: Container(
        padding: const EdgeInsets.only(
          top: Grid.two,
          left: Grid.two,
          right: Grid.two,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.surfaceContainerHighest,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(Grid.two),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MtpCircleImage(
                  user.avatar,
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: Grid.one),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Grid.two,
                          vertical: Grid.one,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName ?? '',
                              style: context.textTheme.titleMedium?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: Grid.quarter),
                            Text(
                              timeago.format(
                                createdAt,
                                locale: context.locale,
                              ),
                              style: context.textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Grid.one),
                    ],
                  ),
                ),
                const SizedBox(width: Grid.one),
                if (isOwner)
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'Edit':
                          onEdit();
                          break;
                        case 'Delete':
                          onDelete();
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        {'text': 'Edit'},
                        {'text': 'Delete'},
                      ].map<PopupMenuEntry<String>>((item) {
                        return PopupMenuItem<String>(
                          value: item['text'] as String,
                          child: Text(item['text'] as String),
                        );
                      }).toList();
                    },
                  )
              ],
            ),
            if (text.isNotEmpty)
              ReadMoreText(
                text,
                trimMode: TrimMode.Line,
                colorClickableText: context.colorScheme.primary,
                trimLines: 3,
                trimCollapsedText: context.l10n.postLabelReadMore,
                trimExpandedText: context.l10n.postLabelReadLess,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            if (imageUrl.isNotEmpty) ...[
              const SizedBox(height: Grid.one),
              InkWell(
                child: SizedBox(
                  width: mediaThumbnailSize,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: MtpImage(
                      imageUrl,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MtpImageViewer(
                        imageUrl: imageUrl,
                        heroTag: imageUrl,
                      ),
                    ),
                  );
                },
              )
            ],
            if (videoUrl.isNotEmpty) ...[
              const SizedBox(height: Grid.one),
              SizedBox(
                width: mediaThumbnailSize,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _CommentVideo(
                    videoUrl: videoUrl,
                  ),
                ),
              ),
            ],
            const SizedBox(height: Grid.one),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReactionItem(
                  likeCount: numberOfReactions,
                  userReaction: userReaction?.reactionType,
                  onReactionChanged: ({
                    required ReactionType? oldReaction,
                    required ReactionType newReaction,
                  }) {
                    onReactionChanged(
                      oldReaction: oldReaction,
                      newReaction: newReaction,
                    );
                  },
                ),
                ReplyButton(
                  onPressed: onReply,
                ),
              ],
            ),
          ],
        ),
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

      onEdit();
    } else if (result == deleteItemValue) {
      if (!context.mounted) return;

      onDelete();
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
  ThematicGroupPostComment? replyToComment,
  ThematicGroupPostComment? comment,
}) {
  final postId = context.read<GroupPostCommentListBloc>().state.postId;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: PostCommentInputEntry(
          postId: postId,
          replyToComment: replyToComment,
          comment: comment,
        ),
      );
    },
  );
}
