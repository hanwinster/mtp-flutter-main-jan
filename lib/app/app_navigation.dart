import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../routes/app_shell_routes.dart';

enum Screen {
  login,
  home,
  course,
  group,
  blog,
  library,
}

extension ScreenExt on Screen {
  String get location {
    return '';

    // switch (this) {
    //   case Screen.login:
    //     return const LoginRoute().location;
    //   case Screen.home:
    //     return const HomeRoute().location;
    //   case Screen.course:
    //     return const MyCoursesRoute().location;
    //   case Screen.group:
    //     return const GroupRoute().location;
    //   case Screen.blog:
    //     return const BlogRoute().location;
    //   case Screen.library:
    //     return const LibraryRoute().location;
    // }
  }
}

class AppNavigation {
  AppNavigation();

  final RedirectManager redirectManager = RedirectManager();

  late GoRouter router = GoRouter(
    routes: $appRoutes,
    initialLocation: HomeRoute().location,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
  );
}

class RedirectManager {
  RedirectManager();

  // get screen for redirect
  Screen? getScreenForRedirect({
    required String currentLocation,
    required bool onboardingCompleted,
    required bool loggedIn,
    required Screen homeScreen,
  }) {
    return null;
  }
}
