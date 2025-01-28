part of '../app_shell_routes.dart';

class GroupRoute extends GoRouteData {
  GroupRoute();

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey(debugLabel: 'ThematicGroupScaffoldKey');

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.authState != current.authState,
      builder: (context, state) {
        if (state.isLoggedIn) {
          return GroupHomeScreenEntry(
            drawer: MtpAppDrawer(
              scaffoldKey: scaffoldKey,
            ),
            scaffoldKey: scaffoldKey,
            onGroupTapped: (ThematicGroupListing group) {
              navigateToGroupFeedRoute(
                context,
                groupId: group.id,
              );
            },
            onLoginClicked: () {
              navigateToLogin(context);
            },
            onNotiClick: () {
              navigateToNotificationsList(context);
            },
          );
        } else {
          return GroupGuestUserScreenEntry(
            drawer: MtpAppDrawer(
              scaffoldKey: scaffoldKey,
            ),
            scaffoldKey: scaffoldKey,
            onLoginClicked: () {
              navigateToLogin(context);
            },
          );
        }
      },
    );
  }
}

@TypedGoRoute<GroupFeedRoutes>(
  path: '/group-feed/:groupId',
  routes: [
    TypedGoRoute<GroupUserProfileRoute>(path: 'me'),
    TypedGoRoute<GroupPendingPostsRoute>(path: 'pending-posts'),
    TypedGoRoute<PostCreateRoutes>(path: 'posts/new', routes: [
      TypedGoRoute<GroupPendingPostRoute>(path: 'pending'),
    ]),
    TypedGoRoute<ThematicGroupPostDetailRoute>(
      path: 'posts/:postId',
      routes: [
        TypedGoRoute<EditPostRoute>(path: 'edit'),
      ],
    ),
  ],
)
class GroupFeedRoutes extends GoRouteData {
  const GroupFeedRoutes({
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GroupFeedScreenEntry(
      groupId: groupId,
      onPostTapped: ({
        required ThematicGroupPost post,
      }) {
        navigateToPostDetailRoute(
          context,
          postId: post.id.toString(),
          groupId: groupId,
        );
      },
      onShareSomethingTapped: ({required String group_id}) {
        navigateToPostCreateRoute(
          context,
          groupId: group_id,
        );
      },
      onPostEditTapped: (
          {required String group_id, required ThematicGroupPost post}) {
        navigateToPostEditRoute(context,
            groupId: group_id, postId: post.id.toString(), post: post);
      },
      onUserProfileClick: ({required String groupId}) {
        GroupUserProfileRoute(groupId: groupId).push(context);
      },
    );
  }
}

class GroupUserProfileRoute extends GoRouteData {
  final String groupId;

  const GroupUserProfileRoute({
    required this.groupId,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GroupUserProfileScreenEntry(
      groupId: groupId,
      onViewPendingPosts: () {
        GroupPendingPostsRoute(groupId: groupId).push(context);
      },
      onShareSomethingTapped: ({required String group_id}) {
        navigateToPostCreateRoute(
          context,
          groupId: group_id,
        );
      },
      onUserProfileClick: ({
        required String groupId,
      }) {
        GroupUserProfileRoute(groupId: groupId).push(context);
      },
      onPostEditTapped: (
          {required String group_id, required ThematicGroupPost post}) {
        navigateToPostEditRoute(context,
            groupId: group_id, postId: post.id.toString(), post: post);
      },
      onPostTapped: ({required ThematicGroupPost post}) {
        navigateToPostDetailRoute(
          context,
          postId: post.id.toString(),
          groupId: groupId,
        );
      },
    );
  }
}

class GroupPendingPostsRoute extends GoRouteData {
  final String groupId;

  const GroupPendingPostsRoute({
    required this.groupId,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GroupPendingPostsScreenEntry(
      groupId: groupId,
    );
  }
}

class PostCreateRoutes extends GoRouteData {
  final String groupId;

  const PostCreateRoutes({required this.groupId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostCreateScreenEntry(
      groupId: groupId,
    );
  }
}

class EditPostRoute extends GoRouteData {
  final String groupId;
  final String postId;
  final ThematicGroupPost $extra;

  const EditPostRoute({
    required this.groupId,
    required this.postId,
    required this.$extra,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final ThematicGroupPost post = $extra;
    return PostEditScreenEntry(
        postId: postId,
        groupId: groupId,
        onPostCreated: (GroupPendingPostData pendingPostData) {
          navigateToPendingPostRoute(
            context,
            groupId: groupId,
            post: pendingPostData,
          );
        },
        post: post);
  }
}

void navigateToPostEditRoute(BuildContext context,
    {required String groupId,
    required String postId,
    required ThematicGroupPost post}) {
  EditPostRoute(groupId: groupId, postId: postId, $extra: post).push(context);
}

Future<void> navigateToPostCreateRoute(
  BuildContext context, {
  required String groupId,
}) async {
  final GroupPendingPostData? createdPost =
      await PostCreateRoutes(groupId: groupId).push(context);
  if (createdPost != null && context.mounted) {
    navigateToPendingPostRoute(
      context,
      groupId: groupId,
      post: createdPost,
    );
  }
}

class ThematicGroupPostDetailRoute extends GoRouteData {
  const ThematicGroupPostDetailRoute({
    required this.postId,
    required this.groupId,
  });

  final String postId;
  final String groupId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailScreenEntry(
      postId: postId,
      groupId: groupId,
      onPostDetailEditTapped: ({
        required String group_id,
        required ThematicGroupPost post,
      }) {
        navigateToPostEditRoute(context,
            groupId: group_id, postId: post.id.toString(), post: post);
      },
    );
  }
}

class GroupPendingPostRoute extends GoRouteData {
  const GroupPendingPostRoute({
    required this.groupId,
    required this.$extra,
  });

  final String groupId;
  final GroupPendingPostData? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      return const SizedBox.shrink();
    }

    final post = $extra!;
    return PendingPostScreen(
      user: post.user,
      imageUrl: post.imageUrl,
      description: post.description,
      uploadedVideoUrl: post.uploadedVideoUrl,
      createdAt: post.createdAt,
    );
  }
}

void navigateToGroupFeedRoute(
  BuildContext context, {
  required String groupId,
}) {
  GroupFeedRoutes(groupId: groupId).push(context);
}

void navigateToPostDetailRoute(
  BuildContext context, {
  required String postId,
  required String groupId,
}) {
  ThematicGroupPostDetailRoute(
    postId: postId,
    groupId: groupId,
  ).push(context);
}

void navigateToPendingPostRoute(
  BuildContext context, {
  required String groupId,
  required GroupPendingPostData post,
}) {
  GroupPendingPostRoute(
    groupId: groupId,
    $extra: post,
  ).pushReplacement(context);
}

void navigateToPostDetailEditRoute(
  BuildContext context, {
  required String groupId,
  required String postId,
  required ThematicGroupPost post,
}) {
  EditPostRoute(
    groupId: groupId,
    postId: postId,
    $extra: post,
  ).push(context);
}
