import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thematic_group/src/group_user_profile/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../../../thematic_group.dart';
import '../../group/group_feed/components/components.dart';
import '../../group_post_list/ui/post_item.dart';
import '../bloc/group_user_profile_bloc.dart';

class GroupUserProfileContent extends StatelessWidget {
  const GroupUserProfileContent({
    super.key,
    required this.onViewPendingPosts,
    required this.onShareSomethingTapped,
    required this.onUserProfileClick,
    required this.groupId,
    required this.onPostTapped,
    required this.onPostEditTapped,
  });

  final Function() onViewPendingPosts;
  final OnShareSomethingTapped onShareSomethingTapped;
  final UserProfileClickCallback onUserProfileClick;
  final String groupId;
  final OnPostTapped onPostTapped;
  final OnPostEditTapped onPostEditTapped;

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = RefreshController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: Grid.two),
          const _ProfileSection(),
          const SizedBox(height: Grid.two),
          ViewPendingPostsButton(
            onPressed: onViewPendingPosts,
          ),
          const SizedBox(height: Grid.two),
          Row(
            children: [
              Text(
                context.l10n.profilePostSomething,
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: Grid.one),
          ShareSomethingCard(
            onCardPressed: () => onShareSomethingTapped(group_id: groupId),
            onUserProfilePressed: () => onUserProfileClick(
              groupId: groupId,
            ),
          ),
          const Divider(),
          const SizedBox(height: Grid.one),
          Row(
            children: [
              Text(
                context.l10n.groupLabelMyFeeds,
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: Grid.one),
          Expanded(
            child: BlocBuilder<GroupUserProfileBloc, GroupUserProfileState>(
              buildWhen: (previous, current) {
                return previous.postsUiState != current.postsUiState;
              },
              builder: (context, state) {
                return state.postsUiState.toView(
                  context,
                  successViewBuilder: (pagedList) {
                    return ListView.builder(
                      itemCount: pagedList.items.length,
                      itemBuilder: (context, index) {
                        final item = pagedList.items[index];
                        return PostItem(
                          post: item,
                          onPostTapped: onPostTapped,
                          onPostDelteTapped: (postID) {},
                          controller: refreshController,
                          onPostEditTapped: onPostEditTapped,
                        );
                      },
                    );
                  },
                  emptyViewBuilder: (data) {
                    return MtpEmpty(
                      message: context.l10n.groupLabelEmptyPost,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupUserProfileBloc, GroupUserProfileState>(
      buildWhen: (previous, current) {
        return previous.currentUserUiState != current.currentUserUiState ||
            previous.totalUserPosts != current.totalUserPosts;
      },
      builder: (context, state) {
        final user = state.currentUserUiState.dataOrNull;
        if (user == null) {
          return const SizedBox();
        }

        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: MtpAssets.images.thematicCoverImage.image(
                      height: 141,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: -50,
                  child: MtpCircleImage(
                    user.profileImageUrl?.thumbnail ?? '',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Grid.seven),
            Text(
              user.fullName,
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(height: Grid.one),
            Text(
              '${context.l10n.groupLabelPostCount(state.totalUserPosts)} . ', //${context.l10n.postLabelPostedOn(user.createdAt!.asString(context))}
              // '${state.totalUserPosts.format(context.locale)} Post . Member Since: Jul 2023',
              style: context.textTheme.labelSmall,
            ),
          ],
        );
      },
    );
  }
}
