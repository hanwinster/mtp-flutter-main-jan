part of '../app_shell_routes.dart';

class HomeRoute extends GoRouteData {
  HomeRoute();

  final GlobalKey<ScaffoldState> scaffoldKey =
  GlobalKey(debugLabel: 'HomeScaffoldKey');

  void _navigateToOfflineCourses(BuildContext context) {
    OfflineCoursesRoute().push(context);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreenEntry(
      drawer: MtpAppDrawer(
        scaffoldKey: scaffoldKey,
      ),
      scaffoldKey: scaffoldKey,
      onChatGPTClick: () {
        navigateToChatGPT(context);
      },
      onCourseCategoryClick: ({
        required CourseCategory category,
      }) {
        navigateToCourseList(
          context,
          category: category,
        );
      },
      onNotiClick: () {
        navigateToNotificationsList(context);
      },
      onOfflineCoursesClick: () {
        _navigateToOfflineCourses(context);
      },
      onCommunityVideoListClick: () {
        navigateToCommunityVideoList(context);
      },
      onCommunityVideoDetailClick: (String videoId) {
        navigateToCommunityVideoDetail(context, videoId);
      },
      onExploreCourseClick: () {
        navigateToCourseList(context);
      },
      onCourseClick: (String courseId) {
        _navigateToCourseDetail(
          context,
          courseId: courseId,
          isEnrolled: false,
          isOfflineMode: false,
        );
      },
    );
  }
}

void navigateToHome(BuildContext context) {
  HomeRoute().go(context);
}

class ChatGPTDetailRoute extends GoRouteData {
  const ChatGPTDetailRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChatGptScreenEntry();
  }

  @override
  Future<bool> onExit(BuildContext context, GoRouterState state) async {
    final matches =
        GoRouter
            .of(context)
            .routerDelegate
            .currentConfiguration
            .matches;
    final previousLocation = matches[matches.length - 2].matchedLocation;
    logger.d('Previous location: $previousLocation');
    context.currentLocation.value = previousLocation;
    return true;
  }
}

void navigateToChatGPT(BuildContext context) {
  const ChatGPTDetailRoute().push(context);
}

class CommunityVideoListRoute extends GoRouteData {
  const CommunityVideoListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CommunityVideoListScreenEntry(
      onCommunityVideoDetailClick: (String videoId) {
        navigateToCommunityVideoDetail(context, videoId);
      },
    );
  }
}

void navigateToCommunityVideoList(BuildContext context) {
  const CommunityVideoListRoute().push(context);
}

class CommunityVideoDetailRoute extends GoRouteData {
  const CommunityVideoDetailRoute({required this.videoId});

  final String videoId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CommunityVideoDetailScreenEntry(
        videoId: videoId,
        onCommunityVideoDetailClick: (String videoId) {
          navigateToCommunityVideoDetail(context, videoId);
        });
  }
}

void navigateToCommunityVideoDetail(BuildContext context, String videoId) {
  CommunityVideoDetailRoute(videoId: videoId).push(context);
}

class OfflineCoursesRoute extends GoRouteData {
  OfflineCoursesRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OfflineCoursesScreenEntry(
      onCourseClick: ({
        required String courseId,
      }) {
        CourseDetailRoute(
          courseId: courseId,
          isEnrolled: true,
          isOfflineMode: true,
        ).push(context);
      },
    );
  }
}
