import 'package:flutter/material.dart';
import 'package:thematic_group/src/group_user_profile/ui/group_user_profile_content.dart';
import 'package:ui/ui.dart';

import '../../../thematic_group.dart';

class GroupUserProfileScreen extends StatelessWidget {
  const GroupUserProfileScreen(
      {super.key,
      required this.onViewPendingPosts,
      required this.onShareSomethingTapped,
      required this.onUserProfileClick,
      required this.groupId,
      required this.onPostTapped,
      required this.onPostEditTapped});

  final ViewPendingPostsCallback onViewPendingPosts;
  final UserProfileClickCallback onUserProfileClick;
  final OnShareSomethingTapped onShareSomethingTapped;
  final String groupId;
  final OnPostTapped onPostTapped;
  final OnPostEditTapped onPostEditTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.profileButtonTextViewProfile,
          style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0057DA),
                Color(0xFF5A9AF9),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: GroupUserProfileContent(
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
