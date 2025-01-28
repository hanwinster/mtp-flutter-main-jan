part of '../app_shell_routes.dart';

class BlogRoute extends GoRouteData {
  BlogRoute();

  final GlobalKey<ScaffoldState> scaffoldKey =
  GlobalKey(debugLabel: 'BlogScaffoldKey');

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.authState != current.authState,
      builder: (context, state) {
        if (state.isLoggedIn) {
          return BlogScreenEntry(
            onPostTapped: (postId) {
              navigateToPostDetails(context, postId);
            },
            drawer: MtpAppDrawer(
              scaffoldKey: scaffoldKey,
            ),
            scaffoldKey: scaffoldKey,
            onNotiClick: () {
              navigateToNotificationsList(context);
            },
          );
        } else {
          return BlogGuestUserScreenEntry(
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

class PostListExtra {
  const PostListExtra({this.tag});

  final BlogPostTag? tag;
}

class PostDetailsRoute extends GoRouteData {
  const PostDetailsRoute({required this.postId});

  final String postId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailsScreenEntry(
      postId: postId,
      onTagTapped: (tag) {
        navigateTagPostList(context, tag.id, tag.name);
      },
      onPostTapped: (postId) {
        navigateToPostDetails(context, postId);
      },
      onTakeQuizTapped: ({
        required String postId,
        required bool isRetake,
      }) {
        PostQuizRoute(
          postId: postId,
          isRetake: isRetake,
        ).push(context);
      },
    );
  }
}

class PostQuizRoute extends GoRouteData {
  const PostQuizRoute({
    required this.postId,
    this.isRetake = false,
  });

  final String postId;
  final bool isRetake;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostQuizScreenEntry(
      postId: postId,
      onPostQuizCompleted: ({
        required String postId,
        required BlogPostQuizUserAnswerResult result,
      }) {
       PostQuizResultRoute(
          postId: postId,
          $extra: PostQuizResultExtra(result: result),
        ).pushReplacement(context);
      },
    );
  }
}

class PostQuizResultExtra extends Equatable {
  const PostQuizResultExtra({required this.result});

  final BlogPostQuizUserAnswerResult result;

  @override
  List<Object> get props => [result];
}

class PostQuizResultRoute extends GoRouteData {
  const PostQuizResultRoute({
    required this.postId,
    this.$extra,
  });

  final String postId;
  final PostQuizResultExtra? $extra;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      return Container();
    }

    return PostQuizResultScreenEntry(
      postId: postId,
      result: $extra!.result,
      onClosed: () {
        Navigator.of(context).pop();
      },
      onRetakeQuiz: ({required String postId}) {
        PostQuizRoute(
          postId: postId,
          isRetake: true,
        ).pushReplacement(context);
      },
    );
  }
}

class TagPostsRoute extends GoRouteData {
  const TagPostsRoute({required this.tagId, this.tagName});

  final String tagId;
  final String? tagName;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostListScreenEntry(
      filter: PostListFilterByTag(tagId),
      title: tagName ?? 'Posts for $tagId',
      onPostTapped: (postId) {
        navigateToPostDetails(context, postId);
      },
    );
  }
}

void navigateTagPostList(BuildContext context,
    String tagId,
    String tagName,) {
  TagPostsRoute(tagId: tagId, tagName: tagName).push(context);
}

void navigateToPostDetails(BuildContext context, String postId) {
  PostDetailsRoute(postId: postId).push(context);
}
