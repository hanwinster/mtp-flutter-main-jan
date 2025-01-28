import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thematic_group/src/group_post_list/bloc/posts_bloc.dart';
import 'package:thematic_group/src/group_user_profile/ui/group_user_profile_screen.dart';

import '../../../thematic_group.dart';
import '../bloc/group_user_profile_bloc.dart';

typedef ViewPendingPostsCallback = void Function();

class GroupUserProfileScreenEntry extends StatelessWidget {
  const GroupUserProfileScreenEntry(
      {super.key,
      required this.groupId,
      required this.onViewPendingPosts,
      required this.onShareSomethingTapped,
      required this.onUserProfileClick,
      required this.onPostTapped,
      required this.onPostEditTapped});

  final String groupId;
  final ViewPendingPostsCallback onViewPendingPosts;
  final UserProfileClickCallback onUserProfileClick;
  final OnShareSomethingTapped onShareSomethingTapped;
  final OnPostTapped onPostTapped;
  final OnPostEditTapped onPostEditTapped;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GroupUserProfileBloc(
            groupId: groupId,
          )
            ..add(const GroupUserProfileApprovedPostsFetched())
            ..add(const GroupUserProfileCurrentUserFetched()),
        ),
        BlocProvider(
          create: (context) => PostsBloc(),
        ),
      ],
      child: GroupUserProfileScreen(
        onViewPendingPosts: onViewPendingPosts,
        onShareSomethingTapped: onShareSomethingTapped,
        onUserProfileClick: onUserProfileClick,
        groupId: groupId,
        onPostTapped: onPostTapped,
        onPostEditTapped: onPostEditTapped,
      ),
    );
  }
}
