import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_list/models/group_type.dart';
import 'package:ui/ui.dart';
import '../../group_info/ui/group_leave_screen_entry.dart';
import '../../group_post_list/group_post_list.dart';
import 'bloc/group_feed_bloc.dart';
import 'group_feed_screen_entry.dart';
import 'components/components.dart';

class GroupFeedScreen extends StatelessWidget {
  final OnPostTapped onPostTapped;
  final String groupId;
  final OnShareSomethingTapped onShareSomethingTapped;
  final UserProfileClickCallback onUserProfileClick;
  final OnPostEditTapped onPostEditTapped;

  const GroupFeedScreen({
    super.key,
    required this.onPostTapped,
    required this.onShareSomethingTapped,
    required this.onUserProfileClick,
    required this.groupId,
    required this.onPostEditTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        elevation: 0,
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        title: const _GroupTitle(),
        actions: [
          GestureDetector(
            onTap: () async {
              final group = context.read<GroupFeedBloc>().state.groupUiState.dataOrNull;
              if (group == null) return;

              await showModalBottomSheet<bool?>(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                builder: (context) {
                  return GroupLeaveInfoScreenEntry(
                      group: group,
                      onCancelClicked: () {},
                      onGroupTapped: (ThematicGroupListing lsiting) {},
                      groupType: GroupType.myGroups,
                      warnType: '');
                },
              );
            },
            child: MtpAssets.icons.arrowNarrowCircleBrokenLeft.svg(
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: Grid.two),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Grid.two),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Grid.two),
            const Welcome(),
            const SizedBox(height: Grid.one),
            ShareSomethingCard(
              onCardPressed: () => onShareSomethingTapped(
                group_id: groupId,
              ),
              onUserProfilePressed: () => onUserProfileClick(
                groupId: groupId,
              ),
            ),
            const Divider(),
            const SizedBox(height: Grid.one),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.groupLabelNewsFeed,
                    style: context.textTheme.titleMedium,
                  ),
                  Expanded(
                    child: PostListView(
                      onPostTapped: onPostTapped,
                      groupId: groupId,
                      onPostEditTapped: onPostEditTapped,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupTitle extends StatelessWidget {
  const _GroupTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupFeedBloc, GroupFeedState>(
      buildWhen: (previous, current) =>
          previous.groupUiState != current.groupUiState,
      builder: (context, state) {
        final group = state.groupUiState.dataOrNull;
        return Text(
          group?.title ?? '',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        );
      },
    );
  }
}
