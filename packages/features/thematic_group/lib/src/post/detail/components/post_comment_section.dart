// import 'package:base/base.dart';
// import 'package:domain/domain.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:readmore/readmore.dart';
// import 'package:thematic_group/src/post/detail/bloc/post_detail_bloc.dart';
// import 'package:thematic_group/src/post/detail/components/post_comment_section_place_holder.dart';
// import 'package:ui/ui.dart';
// import 'package:timeago/timeago.dart' as timeago;
//
// import '../../../common/common.dart';
// import '../../postcomment/input/input.dart';
// import 'group_post_comment_tile.dart';
//
// class PostCommentSliverSection extends StatefulWidget {
//   final String groupId;
//   final String postId;
//   final RefreshController controller;
//
//   const PostCommentSliverSection({
//     super.key,
//     required this.postId,
//     required this.groupId,
//     required this.controller,
//   });
//
//   @override
//   State<PostCommentSliverSection> createState() =>
//       _PostCommentSliverSectionState();
// }
//
// class _PostCommentSliverSectionState extends State<PostCommentSliverSection> {
//   @override
//   void initState() {
//     super.initState();
//     timeago.setLocaleMessages('my', timeago.MyMessages());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PostDetailBloc, PostDetailState>(
//       buildWhen: (previous, current) =>
//           previous.postUiState != current.postUiState,
//       builder: (context, state) {
//         return state.postUiState.toSliverView(
//           context,
//           emptyViewBuilder: (message) {
//             return _EmptySliverList(
//               controller: widget.controller,
//             );
//           },
//           loadingViewBuilder: () {
//             return const PostCommentSliverSectionPlaceholder();
//           },
//           successViewBuilder: (postDetails) {
//             final commentsData = state.postUiState.dataOrNull?.postComments;
//             if (commentsData == null || commentsData.isEmpty) {
//               return _EmptySliverList(controller: widget.controller);
//             }
//
//             return _CommentSliverList(
//               comments: commentsData,
//               groupId: widget.groupId,
//               controller: widget.controller,
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// class _EmptySliverList extends StatelessWidget {
//   final RefreshController controller;
//
//   const _EmptySliverList({required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         [
//           const SizedBox(height: Grid.four),
//           _CommentInput(
//             controller: controller,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _CommentSliverList extends StatelessWidget {
//   const _CommentSliverList({
//     required this.comments,
//     required this.groupId,
//     required this.controller,
//   });
//
//   final List<ThematicGroupPostDetailsComments> comments;
//   final String groupId;
//   final RefreshController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     final sortedComments = comments
//       ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
//
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         [
//           const SizedBox(height: Grid.four),
//           _CommentInput(
//             controller: controller,
//           ),
//           const SizedBox(height: Grid.two),
//           Text(
//             context.l10n.postLabelSubtitleComments,
//             style: Theme.of(context).textTheme.titleMedium,
//           ),
//           const SizedBox(height: Grid.two),
//           ...(sortedComments.mapIndexed((index, comment) {
//             if (index > 0) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: Grid.two),
//                   GroupPostCommentTile(
//                     comment: comment,
//                     groupId: groupId,
//                     controller: controller,
//                   ),
//                 ],
//               );
//             } else {
//               return GroupPostCommentTile(
//                 comment: comment,
//                 groupId: groupId,
//                 controller: controller,
//               );
//             }
//           }).toList())
//         ],
//       ),
//     );
//   }
// }
//
// class _CommentInput extends StatelessWidget {
//   final RefreshController controller;
//
//   const _CommentInput({required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         InkWell(
//           onTap: () {
//             final postId = context.read<PostDetailBloc>().state.postId;
//             _showCommentDialog(context, "post", postId, controller);
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: context.colorScheme.surfaceContainerHighest,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(Grid.one),
//               child: Icon(Icons.image,
//                   color: context.colorScheme.onSurfaceVariant),
//             ),
//           ),
//         ),
//         const SizedBox(width: Grid.one),
//         Expanded(
//           child: MtpOutlinedButton(
//             onPressed: () {
//               final postId = context.read<PostDetailBloc>().state.postId;
//               _showCommentDialog(context, "post", postId, controller);
//             },
//             label: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 context.l10n.postLabelPlaceholderComment,
//                 style: Theme.of(context).textTheme.labelLarge,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   void _showCommentDialog(BuildContext context, String type, String postId,
//       RefreshController controller) {
//     // final postId = context.read<PostDetailBloc>().state.postId;
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: PostCommentInputEntry(
//             postId: postId,
//             type: type,
//           ),
//         );
//       },
//     ).whenComplete(() {
//       controller.requestRefresh();
//     });
//   }
// }
//
// class _ReplyListItem extends StatefulWidget {
//   final RefreshController controller;
//   final int groupId;
//
//   const _ReplyListItem({
//     required this.comment,
//     required this.controller,
//     required this.groupId,
//   });
//
//   final ThematicGroupPostDetailsCommentReplies comment;
//
//   @override
//   State<_ReplyListItem> createState() => _ReplyListItemState();
// }
//
// class _ReplyListItemState extends State<_ReplyListItem> {
//   OverlayEntry? _overlayEntry;
//   String? selectedOption; // Track the selected poll option
//   String? selectedReaction; // Track the selected reaction
//   RenderBox? _overlayBox;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     print("my reaction in reply is : ${widget.comment.myReaction}");
//     if (widget.comment.myReaction != null ||
//         widget.comment.myReaction.toString().isNotEmpty) {
//       selectedReaction = widget.comment.myReaction;
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MtpCircleImage(
//           widget.comment.userAvatar ?? '',
//           width: 48,
//           height: 48,
//         ),
//         const SizedBox(width: Grid.one),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Grid.two),
//                   color: context.colorScheme.surfaceContainerHighest,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: Grid.two,
//                     vertical: Grid.one,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.comment.user!.username ?? '',
//                         style: context.textTheme.titleMedium?.copyWith(
//                           color: context.colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                       ReadMoreText(
//                         widget.comment.description!,
//                         trimMode: TrimMode.Line,
//                         colorClickableText: context.colorScheme.secondary,
//                         trimLines: 3,
//                         trimCollapsedText: context.l10n.postLabelReadMore,
//                         trimExpandedText: context.l10n.postLabelReadLess,
//                         style: context.textTheme.bodyLarge?.copyWith(
//                           color: context.colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               if (widget.comment.imageUrl != null &&
//                   widget.comment.imageUrl!.isNotEmpty) ...[
//                 const SizedBox(height: Grid.one),
//                 InkWell(
//                   child: SizedBox(
//                     width: 150,
//                     child: AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: MtpImage(
//                         widget.comment.imageUrl!,
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => MtpImageViewer(
//                           imageUrl: widget.comment.imageUrl!,
//                           heroTag: widget.comment.imageUrl!,
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               ],
//               const SizedBox(height: Grid.one),
//               Padding(
//                 padding: const EdgeInsets.only(left: Grid.one),
//                 child: Row(
//                   children: [
//                     _buildPostActions(widget.controller),
//                     const SizedBox(width: Grid.one),
//                     Text(
//                       '⬤',
//                       style: context.textTheme.labelSmall?.copyWith(
//                         color: context.colorScheme.onSurface.withOpacity(0.36),
//                       ),
//                     ),
//                     const SizedBox(width: Grid.one),
//                     Flexible(
//                       // Wrap in Flexible
//                       child: Text(
//                         timeago.format(
//                           widget.comment.createdAt!,
//                           locale: context.locale,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                         style: context.textTheme.labelSmall,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (widget.comment.childReplies == null) ...[
//                 const Text("There is no child replies")
//               ],
//               if (widget.comment.childReplies != null &&
//                   widget.comment.childReplies!.isNotEmpty) ...[
//                 ...(widget.comment.childReplies!
//                     .mapIndexed((index, childReplies) {
//                   if (index > 0) {
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: Grid.two),
//                         _ReplyReplyListItem(
//                             comment: childReplies,
//                             controller: widget.controller,
//                             group_id: widget.groupId),
//                       ],
//                     );
//                   } else {
//                     return _ReplyReplyListItem(
//                         comment: childReplies,
//                         controller: widget.controller,
//                         group_id: widget.groupId);
//                   }
//                 }).toList()),
//               ]
//             ],
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildPostActions(RefreshController controller) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onLongPressStart: (details) {
//             _showReactionOverlay(
//                 context, details.globalPosition, widget.comment, controller);
//           },
//           // onLongPressEnd: (_) {
//           //   _removeReactionOverlay();
//           // },
//           // onPanUpdate: (details) {
//           //   _onMove(details.localPosition); // Handle move over reactions
//           // },
//           child: InfoView(
//             icon: _getReactionIcon(context, selectedReaction),
//             iconColor: widget.comment.myReaction == true ||
//                     (selectedReaction != null && selectedReaction!.isNotEmpty)
//                 ? Theme.of(context).primaryColor
//                 : Colors.black,
//             infoText: "${widget.comment.numberOfReactions} Likes",
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         ButtonWithIcon(
//           tap: () {
//             // widget.onPostTapped!(post: widget.post);
//             _showCommentDialog(
//                 context, "comment", widget.comment.id.toString(), controller);
//           },
//           color: Colors.black,
//           iconData: Icons.reply_sharp,
//           showText:
//               "${widget.comment.childReplies != null ? widget.comment.childReplies!.length : 0} Reply",
//         ),
//       ],
//     );
//   }
//
//   void _showReactionOverlay(
//       BuildContext context,
//       Offset position,
//       ThematicGroupPostDetailsCommentReplies post,
//       RefreshController controller) {
//     // Move the overlay to the right by adjusting the `left` value
//     _overlayEntry = _createOverlayEntry(position, post, controller);
//     Overlay.of(context).insert(_overlayEntry!);
//     _overlayBox = context.findRenderObject() as RenderBox?;
//   }
//
//   OverlayEntry _createOverlayEntry(
//       Offset position,
//       ThematicGroupPostDetailsCommentReplies post,
//       RefreshController controller) {
//     return OverlayEntry(
//       builder: (context) => Stack(
//         children: [
//           // This GestureDetector covers the full screen for detecting taps outside the overlay
//           GestureDetector(
//             onTap: _removeReactionOverlay, // Remove overlay on outside tap
//             behavior: HitTestBehavior.translucent,
//             child:
//                 Container(color: Colors.transparent), // Transparent background
//           ),
//           Positioned(
//             top: position.dy - 60,
//             left: position.dx - 50, // Moved a bit to the right
//             child: Material(
//               color: Colors.transparent,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: const [
//                     BoxShadow(blurRadius: 10, color: Colors.black26)
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicLikeIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "like",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicInsightfulIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "informative",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicThankYouIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "thankyou",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicQuestionIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "Question",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicWowIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "inspiring",
//                         post,
//                         controller),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReactionIcon(
//       Widget icon,
//       String reaction,
//       ThematicGroupPostDetailsCommentReplies post,
//       RefreshController controller) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedReaction =
//               reaction; // Remove the overlay after selecting a reaction
//         });
//         _removeReactionOverlay();
//         context.read<PostDetailBloc>().add(ReactToComment(
//             groupId: widget.groupId,
//             reaction_to_id: post.id!,
//             reaction_type: reaction,
//             reaction_to_type: 'reply_to_comment'));
//         controller.requestRefresh();
//       },
//       child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0), child: icon),
//     );
//   }
//
//   void _removeReactionOverlay() {
//     if (selectedReaction != null) {
//       print('User selected $selectedReaction');
//       // Handle the reaction submission here, e.g., send it to the backend
//     }
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//   }
//
//   void _showCommentDialog(BuildContext context, String type, String postId,
//       RefreshController controller) {
//     // final postId = context.read<PostDetailBloc>().state.postId;
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: PostCommentInputEntry(
//             postId: postId,
//             type: type,
//           ),
//         );
//       },
//     ).whenComplete(() {
//       controller.requestRefresh();
//     });
//   }
// }
//
// class _ReplyReplyListItem extends StatefulWidget {
//   final RefreshController controller;
//   final int group_id;
//
//   const _ReplyReplyListItem(
//       {required this.comment,
//       required this.controller,
//       required this.group_id});
//
//   final ThematicGroupPostDetailsCommentsChildReplies comment;
//
//   @override
//   State<_ReplyReplyListItem> createState() => _ReplyReplyListItemState();
// }
//
// class _ReplyReplyListItemState extends State<_ReplyReplyListItem> {
//   OverlayEntry? _overlayEntry;
//   String? selectedOption; // Track the selected poll option
//   String? selectedReaction; // Track the selected reaction
//   RenderBox? _overlayBox;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     print("my reaction in reply is : ${widget.comment.myReaction}");
//     if (widget.comment.myReaction != null ||
//         widget.comment.myReaction.toString().isNotEmpty) {
//       selectedReaction = widget.comment.myReaction;
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MtpCircleImage(
//           widget.comment.userAvatar ?? '',
//           width: 48,
//           height: 48,
//         ),
//         const SizedBox(width: Grid.one),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Grid.two),
//                   color: context.colorScheme.surfaceContainerHighest,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: Grid.two,
//                     vertical: Grid.one,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.comment.user!.username ?? '',
//                         style: context.textTheme.titleMedium?.copyWith(
//                           color: context.colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                       ReadMoreText(
//                         widget.comment.description!,
//                         trimMode: TrimMode.Line,
//                         colorClickableText: context.colorScheme.secondary,
//                         trimLines: 3,
//                         trimCollapsedText: context.l10n.postLabelReadMore,
//                         trimExpandedText: context.l10n.postLabelReadLess,
//                         style: context.textTheme.bodyLarge?.copyWith(
//                           color: context.colorScheme.onSurfaceVariant,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               if (widget.comment.imageUrl != null &&
//                   widget.comment.imageUrl!.isNotEmpty) ...[
//                 const SizedBox(height: Grid.one),
//                 InkWell(
//                   child: SizedBox(
//                     width: 150,
//                     child: AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: MtpImage(
//                         widget.comment.imageUrl!,
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => MtpImageViewer(
//                           imageUrl: widget.comment.imageUrl!,
//                           heroTag: widget.comment.imageUrl!,
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               ],
//               const SizedBox(height: Grid.one),
//               Padding(
//                 padding: const EdgeInsets.only(left: Grid.one),
//                 child: Row(
//                   children: [
//                     _buildPostActions(widget.controller),
//                     const SizedBox(width: Grid.one),
//                     Text(
//                       '⬤',
//                       style: context.textTheme.labelSmall?.copyWith(
//                         color: context.colorScheme.onSurface.withOpacity(0.36),
//                       ),
//                     ),
//                     const SizedBox(width: Grid.one),
//                     Flexible(
//                       // Wrap in Flexible
//                       child: Text(
//                         timeago.format(
//                           widget.comment.createdAt!,
//                           locale: context.locale,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                         style: context.textTheme.labelSmall,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // if(comment.replyDetails.length >0)...
//             ],
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildPostActions(RefreshController controller) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onLongPressStart: (details) {
//             _showReactionOverlay(
//                 context, details.globalPosition, widget.comment, controller);
//           },
//           // onLongPressEnd: (_) {
//           //   _removeReactionOverlay();
//           // },
//           // onPanUpdate: (details) {
//           //   _onMove(details.localPosition); // Handle move over reactions
//           // },
//           child: InfoView(
//             icon: _getReactionIcon(context, selectedReaction),
//             iconColor: widget.comment.myReaction == true ||
//                     (selectedReaction != null && selectedReaction!.isNotEmpty)
//                 ? Theme.of(context).primaryColor
//                 : Colors.black,
//             infoText: "${widget.comment.numberOfReactions} Likes",
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         // ButtonWithIcon(
//         //   tap: () {
//         //     // widget.onPostTapped!(post: widget.post);
//         //     _showCommentDialog(context, "comment", widget.comment.id.toString(),controller);
//         //   },
//         //   color: Colors.black,
//         //   iconData: Icons.reply_sharp,
//         //   showText: "${widget.comment.replyDetails.length} Reply",
//         // ),
//       ],
//     );
//   }
//
//   void _showReactionOverlay(
//       BuildContext context,
//       Offset position,
//       ThematicGroupPostDetailsCommentsChildReplies post,
//       RefreshController controller) {
//     // Move the overlay to the right by adjusting the `left` value
//     _overlayEntry = _createOverlayEntry(position, post, controller);
//     Overlay.of(context).insert(_overlayEntry!);
//     _overlayBox = context.findRenderObject() as RenderBox?;
//   }
//
//   OverlayEntry _createOverlayEntry(
//       Offset position,
//       ThematicGroupPostDetailsCommentsChildReplies post,
//       RefreshController controller) {
//     return OverlayEntry(
//       builder: (context) => Stack(
//         children: [
//           // This GestureDetector covers the full screen for detecting taps outside the overlay
//           GestureDetector(
//             onTap: _removeReactionOverlay, // Remove overlay on outside tap
//             behavior: HitTestBehavior.translucent,
//             child:
//                 Container(color: Colors.transparent), // Transparent background
//           ),
//           Positioned(
//             top: position.dy - 60,
//             left: position.dx - 50, // Moved a bit to the right
//             child: Material(
//               color: Colors.transparent,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: const [
//                     BoxShadow(blurRadius: 10, color: Colors.black26)
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicLikeIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "like",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicInsightfulIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "informative",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicThankYouIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "thankyou",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicQuestionIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "Question",
//                         post,
//                         controller),
//                     _buildReactionIcon(
//                         MtpAssets.images.thematicWowIcon.image(
//                           width: 40,
//                           height: 40,
//                           color: context.colorScheme.primary,
//                         ),
//                         "inspiring",
//                         post,
//                         controller),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildReactionIcon(
//       Widget icon,
//       String reaction,
//       ThematicGroupPostDetailsCommentsChildReplies post,
//       RefreshController controller) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedReaction =
//               reaction; // Remove the overlay after selecting a reaction
//         });
//         _removeReactionOverlay();
//         context.read<PostDetailBloc>().add(ReactToComment(
//             groupId: widget.group_id,
//             reaction_to_id: post.id!,
//             reaction_type: reaction,
//             reaction_to_type: 'reply_to_comment'));
//         controller.requestRefresh();
//       },
//       child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0), child: icon),
//     );
//   }
//
//   void _removeReactionOverlay() {
//     if (selectedReaction != null) {
//       print('User selected $selectedReaction');
//       // Handle the reaction submission here, e.g., send it to the backend
//     }
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//   }
// //
// // void _showCommentDialog(BuildContext context,String type,String postId,RefreshController controller) {
// //   // final postId = context.read<PostDetailBloc>().state.postId;
// //   showDialog(
// //     context: context,
// //     builder: (context) {
// //       return AlertDialog(
// //         content: PostCommentInputEntry(
// //           postId: postId,
// //           type: type,
// //         ),
// //       );
// //     },
// //   ).whenComplete((){
// //     controller.requestRefresh();
// //   });
// // }
// }
//
// Widget _getReactionIcon(BuildContext context, String? reaction) {
//   switch (reaction) {
//     case "like":
//       // return Icons.thumb_up;
//       return MtpAssets.images.thematicLikeIcon.image(
//         width: 20,
//         height: 20,
//         color: context.colorScheme.primary,
//       );
//     case "informative":
//       return MtpAssets.images.thematicInsightfulIcon.image(
//         width: 20,
//         height: 20,
//         color: context.colorScheme.primary,
//       );
//     case "thankyou":
//       return MtpAssets.images.thematicThankYouIcon.image(
//         width: 20,
//         height: 20,
//         color: context.colorScheme.primary,
//       );
//     case "question":
//       return MtpAssets.images.thematicQuestionIcon.image(
//         width: 20,
//         height: 20,
//         color: context.colorScheme.primary,
//       );
//     case "inspiring":
//       return MtpAssets.images.thematicWowIcon.image(
//         width: 20,
//         height: 20,
//         color: context.colorScheme.primary,
//       );
//     default:
//       return MtpAssets.images.thematicUnLikeIcon.image(
//         width: 20,
//         height: 20,
//         color: context.colorScheme.primary,
//       ); // Default to Like icon
//   }
// }
