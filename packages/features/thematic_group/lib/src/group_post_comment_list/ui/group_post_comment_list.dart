import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:thematic_group/src/group_post_comment_list/models/models.dart';
import 'package:timeago/timeago.dart';
import 'package:ui/ui.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'components/components.dart';



class GroupPostCommentSliverList extends StatefulWidget {
  const GroupPostCommentSliverList({
    super.key,
    required this.comments,
  });

  final List<UiGroupPostCommentListItem> comments;

  @override
  State<GroupPostCommentSliverList> createState() => _GroupPostCommentSliverListState();
}

class _GroupPostCommentSliverListState extends State<GroupPostCommentSliverList> {

  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('my', MyMessages());
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: Grid.two),
          Text(
            context.l10n.postLabelSubtitleComments,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: Grid.two),
          ...(widget.comments.mapIndexed((index, item) {
            if (index > 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Grid.two),
                  GroupPostCommentTile(item: item),
                ],
              );
            }
            return GroupPostCommentTile(item: item);
          }).toList())
        ],
      ),
    );
  }
}
