import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thematic_group/src/group_post_comment_list/bloc/bloc.dart';
import 'package:thematic_group/src/group_post_comment_list/models/models.dart';
import 'package:thematic_group/src/group_post_comment_list/ui/components/group_post_comment_card.dart';
import 'package:ui/ui.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../group_post_comment_input/group_post_comment_input.dart';
import '../../../group_post_comment_reply_input/group_post_comment_reply_input.dart';

const mediaThumbnailSize = 200.0;

class GroupPostCommentTile extends StatelessWidget {
  const GroupPostCommentTile({
    super.key,
    required this.item,
  });

  final UiGroupPostCommentListItem item;

  bool isLastReply(int index) {
    return index == item.replies.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    final comment = item.comment;
    return Column(
      children: [
        GroupPostCommentCard(
          user: comment.user,
          text: comment.description,
          imageUrl: comment.imageUrl,
          videoUrl: comment.videoFile,
          isOwner: item.isOwner,
          numberOfReactions: comment.numberOfReactions,
          userReaction: comment.userReaction,
          createdAt: comment.createdAt,
          onReactionChanged: ({
            required ReactionType? oldReaction,
            required ReactionType newReaction,
          }) { 
            context.read<GroupPostCommentListBloc>().add(
                  GroupPostCommentReactionChanged(
                    reactionToId: comment.id,
                    reactionToType: ThematicGroupReactionToType.comment,
                    currentReaction: comment.userReaction,
                    newReactionType: newReaction,
                  ),
                );
          },
          onReply: () {
            _showReplyDialog(
              context,
              replyToComment: comment,
            );
          },
          onEdit: () {
            _showCommentDialog(
              context,
              comment: comment,
            );
          },
          onDelete: () {
            context.read<GroupPostCommentListBloc>().add(
                  GroupPostCommentDeleted(comment.id),
                );
          },
        ),
        if (item.replies.isNotEmpty) ...[
          for (final (index, reply) in item.replies.indexed) ...[
            const SizedBox(height: Grid.one),
            Padding(
              padding: const EdgeInsets.only(left: Grid.two),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: Grid.four),
                    child: GroupPostCommentCard(
                      user: reply.reply.user,
                      text: reply.reply.description,
                      imageUrl: reply.reply.imageUrl,
                      videoUrl: '',
                      isOwner: item.isOwner,
                      numberOfReactions: reply.reply.numberOfReactions,
                      userReaction: reply.reply.userReaction,
                      createdAt: reply.reply.createdAt,
                      onReactionChanged: ({
                        required ReactionType? oldReaction,
                        required ReactionType newReaction,
                      }) { 
                        context.read<GroupPostCommentListBloc>().add(
                              GroupPostCommentReactionChanged(
                                reactionToId: reply.reply.id,
                                reactionToType:
                                    ThematicGroupReactionToType.replyToComment,
                                currentReaction: reply.reply.userReaction,
                                newReactionType: newReaction,
                              ),
                            );
                      },
                      onReply: () {
                        _showReplyDialog(
                          context,
                          replyToComment: comment,
                        );
                      },
                      onEdit: () {
                        _showReplyDialog(
                          context,
                          replyToComment: comment,
                          reply: reply.reply,
                        );
                      },
                      onDelete: () {
                        context.read<GroupPostCommentListBloc>().add(
                              GroupPostCommentReplyDeleted(reply.reply.id),
                            );
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: Grid.two,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    endIndent: isLastReply(index)
                                        ? constraints.maxHeight / 2
                                        : 0,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ],
    );
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
}) async {
  final postId = context.read<GroupPostCommentListBloc>().state.postId;
  final result = await showDialog<ThematicGroupPostComment?>(
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
  if (result != null && context.mounted) {
    context.read<GroupPostCommentListBloc>().add(
          GroupPostCommentUpdated(result),
        );
  }
}

void _showReplyDialog(
  BuildContext context, {
  required ThematicGroupPostComment replyToComment,
  ThematicGroupPostCommentReply? reply,
}) async {
  final postId = context.read<GroupPostCommentListBloc>().state.postId;
  final result = await showDialog<ThematicGroupPostCommentReply?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: PostCommentReplyInputEntry(
          postId: postId,
          replyToComment: replyToComment,
          reply: reply,
        ),
      );
    },
  );
  if (result != null && context.mounted) {
    if (reply == null) {
      context.read<GroupPostCommentListBloc>().add(
            GroupPostCommentReplyAdded(result),
          );
    } else {
      context.read<GroupPostCommentListBloc>().add(
            GroupPostCommentReplyUpdated(result),
          );
    }
  }
}
