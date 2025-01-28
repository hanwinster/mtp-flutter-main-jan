// import 'package:domain/domain.dart';
// import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:readmore/readmore.dart';
// import 'package:ui/ui.dart';
// import 'package:timeago/timeago.dart' as timeago;
//
//
// class GroupPostCommentTile extends StatefulWidget {
//   final RefreshController controller;
//
//   const GroupPostCommentTile({super.key,
//     required this.comment,
//     required this.groupId,
//     required this.controller,
//   });
//
//   final ThematicGroupPostDetailsComments comment;
//   final String groupId;
//
//   @override
//   State<GroupPostCommentTile> createState() => GroupPostCommentTileState();
// }
//
// class GroupPostCommentTileState extends State<GroupPostCommentTile> {
//
//   @override
//   void initState() {
//     timeago.setLocaleMessages('my', timeago.MyMessages());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(Grid.two),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: context.colorScheme.surfaceContainerHighest,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(Grid.two),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               MtpCircleImage(
//                 widget.comment.userAvatar ?? '',
//                 width: 48,
//                 height: 48,
//               ),
//               const SizedBox(width: Grid.one),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.comment.user?.username ?? '',
//                           style: context.textTheme.titleMedium?.copyWith(
//                             color: context.colorScheme.onSurfaceVariant,
//                           ),
//                         ),
//                         Text(
//                           timeago.format(
//                             widget.comment.createdAt,
//                             locale: context.locale,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                           style: context.textTheme.labelSmall,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           if (widget.comment.description.isNotEmpty) ...[
//             const SizedBox(height: Grid.one),
//             ReadMoreText(
//               parseTextFromHtml(widget.comment.description),
//               trimMode: TrimMode.Line,
//               colorClickableText: context.colorScheme.secondary,
//               trimLines: 3,
//               trimCollapsedText: context.l10n.postLabelReadMore,
//               trimExpandedText: context.l10n.postLabelReadLess,
//               style: context.textTheme.bodyLarge?.copyWith(
//                 color: context.colorScheme.onSurfaceVariant,
//               ),
//             ),
//           ],
//           if (widget.comment.imageUrl.isNotEmpty) ...[
//             const SizedBox(height: Grid.one),
//             InkWell(
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: MtpImage(
//                   widget.comment.imageUrl.thumbnail,
//                 ),
//               ),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => MtpImageViewer(
//                       imageUrl: widget.comment.imageUrl.original,
//                       heroTag: widget.comment.imageUrl.original,
//                     ),
//                   ),
//                 );
//               },
//             )
//           ],
//           if (widget.comment.videoUrl.isNotEmpty) ...[
//             const SizedBox(height: Grid.one),
//             AspectRatio(
//               aspectRatio: 16 / 9,
//               child: MtpVideoPreview(
//                 videoUrl: widget.comment.videoUrl,
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
