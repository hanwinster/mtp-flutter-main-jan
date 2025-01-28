
import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thematic_group/src/common/interaction/interaction.dart';
import 'package:thematic_group/src/group_post_list/bloc/posts_bloc.dart';
import 'package:thematic_group/src/group/group_feed/group_feed_screen_entry.dart';
import 'package:ui/ui.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../common/common.dart';

class PostItem extends StatefulWidget {
  final ThematicGroupPost post;
  final OnPostTapped? onPostTapped;
  final Map<String, int>? pollOptions;
  final RefreshController controller;
  final Function(String postID) onPostDelteTapped;
  final OnPostEditTapped onPostEditTapped;

  const PostItem({
    super.key,
    required this.post,
    this.pollOptions,
    this.onPostTapped,
    required this.controller,
    required this.onPostDelteTapped,
    required this.onPostEditTapped,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  OverlayEntry? _overlayEntry;
  String? selectedOption; // Track the selected poll option
  String? selectedReaction; // Track the selected reaction
  RenderBox? _overlayBox; // Used to track the position of the overlay
  late int post_reaction_count;
  late ReactionType selectedReactionType;

  @override
  void initState() {
    if (widget.post.myReaction != null ||
        widget.post.myReaction.toString().isNotEmpty) {
      selectedReaction = widget.post.myReaction;
      selectedReactionType = widget.post.myReaction != null
          ? ReactionTypeHelper.getEnum(widget.post.myReaction)
          : ReactionType.unknown;
    }
    if (widget.post.numberOfReactions > 0) {
      post_reaction_count = widget.post.numberOfReactions;
    } else {
      post_reaction_count = 0;
    }
    super.initState();
    timeago.setLocaleMessages('my', timeago.MyMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Grid.one),
        side: BorderSide(
          color: context.colorScheme.outline.withOpacity(0.12),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostHeader(
                widget.post.user.profileImageUrl?.thumbnail ?? '',
                widget.post.username,
                widget.post.createdAt,
                widget.post.id.toString(),
                widget.post,
                widget.controller),
            const SizedBox(height: Grid.one),
            _PostContent(
                bodyUpper: '',
                blockQuote: widget.post.description,
                bodyLower: ''),
            if (widget.post.imageUrl != null) ...[
              const SizedBox(height: Grid.one),
              AspectRatio(
                aspectRatio: defaultImageAspectRatio,
                child: MtpImage(widget.post.imageUrl!),
              ),
            ],
            if (widget.post.uploadedVideoUrl != null) ...[
              const SizedBox(height: Grid.one),
              MtpVideoPlayer(videoUrl: widget.post.uploadedVideoUrl!),
            ],
            if (widget.pollOptions != null) ...[
              const SizedBox(height: Grid.one),
              _buildPollOptions(widget.pollOptions!),
            ],
            if (widget.pollOptions == null) ...[
              const SizedBox(height: Grid.one),
              _buildPostActions(
                  widget.post.numberOfReactions, widget.post.numberOfComments),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPostHeader(
    String profileImageUrl,
    String userName,
    DateTime timeAgo,
    String postId,
    ThematicGroupPost post,
    RefreshController controller,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AccountView(
            image: profileImageUrl,
            name: userName,
            info: timeago.format(
              timeAgo,
              locale: context.locale,
            ),
          ),
        ),
        BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
          return state.userUiState.toView(context, successViewBuilder: (data) {
            final settingList = (userName == data?.username)
                ? [
                    {
                      'icon': Icons.edit,
                      'text': context.l10n.groupLabelEditPost
                    },
                    // {'icon': Icons.visibility_off, 'text': 'Hide Post'},
                    {
                      'icon': Icons.delete,
                      'text': context.l10n.groupLabelDeletePost
                    },
                  ]
                : [
                    // {'icon': Icons.visibility_off, 'text': 'Hide Post'},
                  ];
            return (userName == data?.username)
                ? PopupMenuButton<String>(
                    onSelected: (value) {
                      if (settingList.length > 1) {
                        switch (value) {
                          case 'Edit Post':
                            widget.onPostEditTapped(
                                group_id: post.groupId.toString(), post: post);
                            break;
                          case 'Delete Post':
                            widget.onPostDelteTapped(postId);
                            break;
                        }
                      } else {
                        //handle hid post
                      }
                      // if(value == settingList.){}
                    },
                    itemBuilder: (BuildContext context) {
                      return settingList.map<PopupMenuEntry<String>>((item) {
                        return PopupMenuItem<String>(
                          value: item['text'] as String,
                          child: Row(
                            children: [
                              Icon(item['icon'] as IconData,
                                  color: Colors.black54),
                              const SizedBox(width: 10),
                              Text(item['text'] as String),
                            ],
                          ),
                        );
                      }).toList();
                    },
                  )
                : const SizedBox();
          });
        }),
      ],
    );
  }

  Widget _buildPostActions(int likes, int comments) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReactionItem(
            likeCount: post_reaction_count,
            userReaction: selectedReactionType,
            onReactionChanged: ({
              required ReactionType? oldReaction,
              required ReactionType newReaction,
            }) {
              setState(() {
                if (selectedReaction == null) {
                  post_reaction_count += 1;
                }
                selectedReactionType = newReaction;
                selectedReaction = newReaction.name;
              });
              _removeReactionOverlay();
              if (newReaction == oldReaction) {
                context.read<PostsBloc>().add(UnReactToPost(
                    groupId: widget.post.groupId,
                    postId: widget.post.userReaction?.id ?? 1,
                    reaction_type: newReaction.name));
                setState(() {
                  if (selectedReaction != null) {
                    post_reaction_count -= 1;
                  }
                  selectedReactionType = ReactionType.unknown;
                });
              } else {
                context.read<PostsBloc>().add(ReactToPost(
                    groupId: widget.post.groupId,
                    postId: widget.post.id,
                    reaction_type:
                        ReactionTypeHelper.getEnum(newReaction.name)));
              }
            }),
        // LongPressListener(
        //   onLongPress: (position) {
        //     _showReactionOverlay(context, position, widget.post);
        //   },
        //   child: InfoView(
        //     icon: _getReactionIcon(selectedReaction),
        //     iconColor: widget.post.myReaction == true ||
        //             (selectedReaction != null && selectedReaction!.isNotEmpty)
        //         ? Theme.of(context).primaryColor
        //         : Colors.black,
        //     infoText: context.l10n.groupLabelLikeCount(post_reaction_count),
        //   ),
        // ),
        ButtonWithIcon(
          tap: () {
            widget.onPostTapped!(post: widget.post);
          },
          color: Colors.black,
          iconData: Icons.mode_comment_outlined,
          showText: context.l10n.groupLabelCommentCount(comments),
        ),
      ],
    );
  }

  void _showReactionOverlay(
      BuildContext context, Offset position, ThematicGroupPost post) {
    // Move the overlay to the right by adjusting the `left` value
    _overlayEntry = _createOverlayEntry(position, post);
    Overlay.of(context).insert(_overlayEntry!);
    _overlayBox = context.findRenderObject() as RenderBox?;
  }

  OverlayEntry _createOverlayEntry(Offset position, ThematicGroupPost post) {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // This GestureDetector covers the full screen for detecting taps outside the overlay
          GestureDetector(
            onTap: _removeReactionOverlay, // Remove overlay on outside tap
            behavior: HitTestBehavior.translucent,
            child:
                Container(color: Colors.transparent), // Transparent background
          ),
          Positioned(
            top: position.dy - 60,
            left: position.dx - 50, // Moved a bit to the right
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(blurRadius: 10, color: Colors.black26)
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildReactionIcon(
                      MtpAssets.images.thematicLikeIcon.image(
                        width: 20,
                        height: 20,
                        color: context.colorScheme.primary,
                      ),
                      "like",
                      post,
                    ),
                    _buildReactionIcon(
                      MtpAssets.images.thematicInsightfulIcon.image(
                        width: 20,
                        height: 20,
                        color: context.colorScheme.primary,
                      ),
                      "informative",
                      post,
                    ),
                    _buildReactionIcon(
                      MtpAssets.images.thematicThankYouIcon.image(
                        width: 20,
                        height: 20,
                        color: context.colorScheme.primary,
                      ),
                      "thankyou",
                      post,
                    ),
                    _buildReactionIcon(
                      MtpAssets.images.thematicQuestionIcon.image(
                        width: 20,
                        height: 20,
                        color: context.colorScheme.primary,
                      ),
                      "question",
                      post,
                    ),
                    _buildReactionIcon(
                      MtpAssets.images.thematicWowIcon.image(
                        width: 20,
                        height: 20,
                        color: context.colorScheme.primary,
                      ),
                      "inspiring",
                      post,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getReactionIcon(String? reaction) {
    switch (reaction) {
      case "like":
        return MtpAssets.images.thematicLikeIcon.image(
          width: 20,
          height: 20,
          color: context.colorScheme.primary,
        );
      case "informative":
        return MtpAssets.images.thematicInsightfulIcon.image(
          width: 20,
          height: 20,
          color: context.colorScheme.primary,
        );
      case "thankyou":
        return MtpAssets.images.thematicThankYouIcon.image(
          width: 20,
          height: 20,
          color: context.colorScheme.primary,
        );
      case "question":
        return MtpAssets.images.thematicQuestionIcon.image(
          width: 20,
          height: 20,
          color: context.colorScheme.primary,
        );
      case "inspiring":
        return MtpAssets.images.thematicWowIcon.image(
          width: 20,
          height: 20,
          color: context.colorScheme.primary,
        );
      default:
        return MtpAssets.images.thematicUnLikeIcon.image(
          width: 20,
          height: 20,
          color: context.colorScheme.primary,
        ); // Default to Like icon
    }
  }

  Widget _buildReactionIcon(
      Widget icon, String reaction, ThematicGroupPost post) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   if (selectedReaction == null) {
        //     post_reaction_count += 1;
        //   }
        //   selectedReaction =
        //       reaction; // Remove the overlay after selecting a reaction
        // });
        // _removeReactionOverlay();
        // context.read<PostsBloc>().add(ReactToPost(
        //     groupId: post.groupId, postId: post.id, reaction_type: reaction));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), child: icon),
    );
  }

  void _removeReactionOverlay() {
    if (selectedReaction != null) {
      print('User selected $selectedReaction');
      // Handle the reaction submission here, e.g., send it to the backend
    }
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildPollOptions(Map<String, int> options) {
    return Column(
      children: options.entries.map((entry) {
        final optionText = entry.key;
        final percentage = entry.value;

        return InkWell(
          onTap: () {
            setState(() {
              selectedOption = optionText;
            });
            _removeReactionOverlay();
          },
          splashColor: Colors.lightBlueAccent,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: selectedOption == optionText
                  ? Colors.redAccent
                  : Colors.redAccent.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  optionText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _PostContent extends StatelessWidget {
  const _PostContent({
    required this.bodyUpper,
    required this.blockQuote,
    required this.bodyLower,
  });

  final String bodyUpper;
  final String blockQuote;
  final String bodyLower;

  @override
  Widget build(BuildContext context) {
    String content = "";
    if (bodyUpper.isNotEmpty) content += bodyUpper;
    if (blockQuote.isNotEmpty) {
      content += '<blockquote>$blockQuote</blockquote>';
    }
    if (bodyLower.isNotEmpty) content += bodyLower;
    return MtpHtml(
      content,
      textStyle: context.textTheme.bodyLarge,
    );
  }
}
