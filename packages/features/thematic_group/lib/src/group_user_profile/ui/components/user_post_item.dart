import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../common/account_view.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserPostItem extends StatefulWidget {
  const UserPostItem({super.key, required this.post});

  final ThematicGroupPost post;


  @override
  State<UserPostItem> createState() => _UserPostItemState();
}

class _UserPostItemState extends State<UserPostItem> {
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
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AccountView(
            image: widget.post.user.profileImageUrl?.thumbnail ?? '',
            name: widget.post.username,
            info: timeago.format(
              widget.post.createdAt,
              locale: context.locale,
            ),
          ),

        ),
       
        ]),
           
            const SizedBox(height: Grid.one),
            _PostContent(
                bodyUpper: '',
                blockQuote: widget.post.description,
                bodyLower: ''),
            // if (widget.post.imageUrl != null) ...[
            //   const SizedBox(height: Grid.one),
            //   AspectRatio(
            //     aspectRatio: defaultImageAspectRatio,
            //     child: MtpImage(widget.post.imageUrl!),
            //   ),
            // ],
            // if (widget.post.uploadedVideoUrl != null) ...[
            //   const SizedBox(height: Grid.one),
            //   MtpVideoPlayer(videoUrl: widget.post.uploadedVideoUrl!),
            // ],
            // if (widget.pollOptions != null) ...[
            //   const SizedBox(height: Grid.one),
            //   _buildPollOptions(widget.pollOptions!),
            // ],
            // if (widget.pollOptions == null) ...[
            //   const SizedBox(height: Grid.one),
            //   _buildPostActions(
            //     widget.post.numberOfReactions,
            //     widget.post.numberOfComments,
            //   ),
            // ],
          ],
        ),
      ),
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
