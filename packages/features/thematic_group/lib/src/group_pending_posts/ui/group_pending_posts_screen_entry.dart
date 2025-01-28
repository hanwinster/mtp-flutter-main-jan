import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_pending_posts/ui/group_pending_posts_screen.dart';

import '../bloc/group_pending_posts_bloc.dart';

class GroupPendingPostsScreenEntry extends StatelessWidget {
  const GroupPendingPostsScreenEntry({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupPendingPostsBloc(
        groupId: groupId,
      )..add(const GroupPendingPostsFetched()),
      child: const GroupPendingPostsScreen(),
    );
  }
}
