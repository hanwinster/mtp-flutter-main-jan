import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group/group_feed/bloc/group_feed_bloc.dart';
import 'package:thematic_group/src/group_post_list/bloc/posts_bloc.dart';

import 'group_feed_screen.dart';

typedef OnPostTapped = void Function({
  required ThematicGroupPost post,
});

typedef OnShareSomethingTapped = void Function({
  required String group_id,
});

typedef OnPostEditTapped = void Function({
  required String group_id,
  required ThematicGroupPost post,
});

typedef UserProfileClickCallback = void Function({
  required String groupId,
});

class GroupFeedScreenEntry extends StatelessWidget {
  const GroupFeedScreenEntry({
    super.key,
    required this.groupId,
    required this.onPostTapped,
    required this.onUserProfileClick,
    required this.onShareSomethingTapped,
    required this.onPostEditTapped,
  });

  final String groupId;
  final OnPostTapped onPostTapped;
  final UserProfileClickCallback onUserProfileClick;
  final OnShareSomethingTapped onShareSomethingTapped;
  final OnPostEditTapped onPostEditTapped;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PostsBloc()..add(PostsFetched(groupId: groupId, pageSize: 15)),
        ),
        BlocProvider(
          create: (context) => GroupFeedBloc(groupId: groupId)
            ..add(const GroupFeedGroupFetched()),
        ),
      ],
      child: GroupFeedScreen(
          onPostTapped: onPostTapped,
          onShareSomethingTapped: onShareSomethingTapped,
          groupId: groupId,
          onPostEditTapped: onPostEditTapped,
          onUserProfileClick: onUserProfileClick),
    );
  }
}
