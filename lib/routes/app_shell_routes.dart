import 'dart:async';

import 'package:auth/auth.dart';
import 'package:base/base.dart';
import 'package:blog/blog.dart';
import 'package:domain/domain.dart';
import 'package:e_library/e_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help/help.dart';
import 'package:home/home.dart';
import 'package:learning/learning.dart';
import 'package:mtp/app/bloc/app_bloc.dart';
import 'package:mtp/drawer/app_drawer.dart';
import 'package:mtp/routes/inherited_route_location.dart';
import 'package:notification/noti.dart';
import 'package:profile/profile.dart';
import 'package:settings/settings.dart';
import 'package:thematic_group/thematic_group.dart';
import 'package:ui/ui.dart';

import '../main.dart';

part 'app_shell_routes.g.dart';

part 'branches/blog_branch.dart';

part 'branches/course_branch.dart';

part 'branches/group_branch.dart';

part 'branches/home_branch.dart';

part 'branches/library_branch.dart';

part 'routes/auth_routes.dart';

part 'routes/blog_routes.dart';

part 'routes/group_routes.dart';

part 'routes/help_routes.dart';

part 'routes/home_routes.dart';

part 'routes/learning_routes.dart';

part 'routes/library_routes.dart';

part 'routes/notification_routes.dart';

part 'routes/profile_routes.dart';

part 'routes/settings_routes.dart';

part 'scaffold_with_nav_bar.dart';

final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const homePath = '/';
const myCoursesPath = '/my-courses';
const groupPath = '/group';
const blogPath = '/blog-posts';
const libraryPath = '/library';

const chatGPTPath = 'chat-gpt';
const communityVideoListPath = 'community-video-list';
const String notiListPath = 'notifications';

const homeIndex = 0;
const myCoursesIndex = 1;
const groupIndex = 2;
const blogIndex = 3;
const libraryIndex = 4;

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(
          path: homePath,
          routes: [
            TypedGoRoute<NotificationRoutes>(
              path: notiListPath,
              routes: [
                TypedGoRoute<NotificationDetailRoutes>(path: ':notiId'),
              ],
            ),
            TypedGoRoute<OfflineCoursesRoute>(path: 'offline-courses'),
            TypedGoRoute<ChatGPTDetailRoute>(
              path: chatGPTPath,
            ),
            TypedGoRoute<CommunityVideoListRoute>(path: communityVideoListPath),
            TypedGoRoute<CommunityVideoDetailRoute>(path: 'videos/:videoId'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<CourseBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<MyCoursesRoute>(path: myCoursesPath),
      ],
    ),
    TypedStatefulShellBranch<GroupBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<GroupRoute>(path: groupPath),
      ],
    ),
    TypedStatefulShellBranch<BlogBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<BlogRoute>(
          path: blogPath,
          routes: [
            TypedGoRoute<PostDetailsRoute>(path: ':postId'),
            TypedGoRoute<PostQuizRoute>(
              path: ':postId/quiz',
              routes: [
                TypedGoRoute<PostQuizResultRoute>(path: 'result'),
              ],
            ),
            TypedGoRoute<TagPostsRoute>(path: 'tags/:tagId/posts'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<LibraryBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<LibraryRoute>(
          path: libraryPath,
          routes: [
            TypedGoRoute<LibraryDetailsRoute>(path: ':resourceId'),
          ],
        ),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state,
      StatefulNavigationShell navigationShell) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'appShellRouteData';

  static Widget $navigatorContainerBuilder(BuildContext context,
      StatefulNavigationShell navigationShell, List<Widget> children) {
    return ScaffoldWithNavBar(
      navigationShell: navigationShell,
      children: children,
    );
  }
}
