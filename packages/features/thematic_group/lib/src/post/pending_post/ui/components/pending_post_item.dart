import 'dart:io';

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';
import 'package:thematic_group/src/group/group_feed/group_feed_screen_entry.dart';
import 'package:ui/ui.dart';

import '../../../../common/account_view.dart';
import '../../../../common/button_with_icon.dart';
import 'package:timeago/timeago.dart' as timeago;

class PendingPostItem extends StatefulWidget {
  final OnPostTapped? onPostTapped;
  final Map<String, int>? pollOptions;
  final User user;
  final DateTime createdAt;
  final File? imageUrl;
  final File? uploadedVideoUrl;
  final String? description;

  const PendingPostItem({
    super.key,
    this.pollOptions,
    this.onPostTapped,
    required this.user,
    this.imageUrl,
    this.description,
    this.uploadedVideoUrl,
    required this.createdAt,
  });

  @override
  State<PendingPostItem> createState() => _PendingPostItemState();
}

class _PendingPostItemState extends State<PendingPostItem> {
  String? selectedOption; // Track the selected poll option

  @override
  void initState() {
    timeago.setLocaleMessages('my', timeago.MyMessages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostHeader(
              widget.user.profileImageUrl!.original,
              widget.user.username,
              timeago.format(widget.createdAt, locale: context.locale),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description!,
              style: context.textTheme.bodyMedium,
            ),
            if (widget.imageUrl != null) ...[
              const SizedBox(height: 10),
              MtpNetworkImage(
                widget.imageUrl!.uri.path,
                fit: BoxFit.fill,
                width: double.infinity,
                height: 184,
                showMessage: false,
              ),
            ],
            if (widget.uploadedVideoUrl != null) ...[
              const SizedBox(height: 10),
              MtpVideoPlayer(videoUrl: widget.uploadedVideoUrl!.path),
            ],
            if (widget.pollOptions != null) ...[
              const SizedBox(height: 10),
              _buildPollOptions(widget.pollOptions!),
            ],
            if (widget.pollOptions == null) ...[
              const SizedBox(height: 10),
              _buildPostActions(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPostHeader(String? image, String userName, String timeAgo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AccountView(
            image: image,
            name: userName,
            info: timeAgo,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$value ${context.l10n.txtSelected}'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          itemBuilder: (BuildContext context) {
            return [
              {'icon': Icons.edit, 'text': context.l10n.groupLabelEditPost},
              {
                'icon': Icons.visibility_off,
                'text': context.l10n.groupLabelHidePost
              },
              {'icon': Icons.delete, 'text': context.l10n.groupLabelDeletePost},
            ].map<PopupMenuEntry<String>>((item) {
              return PopupMenuItem<String>(
                value: item['text'] as String,
                child: Row(
                  children: [
                    Icon(item['icon'] as IconData, color: Colors.black54),
                    const SizedBox(width: 10),
                    Text(item['text'] as String),
                  ],
                ),
              );
            }).toList();
          },
        )
      ],
    );
  }

  Widget _buildPostActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonWithIcon(
          tap: () {},
          color: Colors.black,
          iconData: Icons.thumb_up_outlined,
          showText: '0 like',
        ),
        ButtonWithIcon(
          tap: () {},
          color: Colors.black,
          iconData: Icons.mode_comment_outlined,
          showText: "0 Comments",
        ),
        ButtonWithIcon(
          tap: () {},
          color: Colors.black,
          iconData: Icons.share_outlined,
          showText: "0 Shares",
        ),
      ],
    );
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
            // _removeReactionOverlay();
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
