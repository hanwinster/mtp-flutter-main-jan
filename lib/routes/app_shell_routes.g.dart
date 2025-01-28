// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_shell_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
      $loginRoute,
      $registerRoute,
      $forgotPasswordRoute,
      $resetPasswordRoute,
      $otpVerificationRoute,
      $authSuccessRoute,
      $groupFeedRoutes,
      $helpRoute,
      $courseListRoute,
      $profileRoute,
      $settingsRoute,
    ];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
      restorationScopeId: AppShellRouteData.$restorationScopeId,
      navigatorContainerBuilder: AppShellRouteData.$navigatorContainerBuilder,
      factory: $AppShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $HomeRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'notifications',
                  parentNavigatorKey: NotificationRoutes.$parentNavigatorKey,
                  factory: $NotificationRoutesExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':notiId',
                      parentNavigatorKey:
                          NotificationDetailRoutes.$parentNavigatorKey,
                      factory: $NotificationDetailRoutesExtension._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'offline-courses',
                  parentNavigatorKey: OfflineCoursesRoute.$parentNavigatorKey,
                  factory: $OfflineCoursesRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'chat-gpt',
                  parentNavigatorKey: ChatGPTDetailRoute.$parentNavigatorKey,
                  factory: $ChatGPTDetailRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'community-video-list',
                  factory: $CommunityVideoListRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'videos/:videoId',
                  factory: $CommunityVideoDetailRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/my-courses',
              factory: $MyCoursesRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/group',
              factory: $GroupRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/blog-posts',
              factory: $BlogRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':postId',
                  parentNavigatorKey: PostDetailsRoute.$parentNavigatorKey,
                  factory: $PostDetailsRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: ':postId/quiz',
                  parentNavigatorKey: PostQuizRoute.$parentNavigatorKey,
                  factory: $PostQuizRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'result',
                      parentNavigatorKey:
                          PostQuizResultRoute.$parentNavigatorKey,
                      factory: $PostQuizResultRouteExtension._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'tags/:tagId/posts',
                  parentNavigatorKey: TagPostsRoute.$parentNavigatorKey,
                  factory: $TagPostsRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/library',
              factory: $LibraryRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':resourceId',
                  parentNavigatorKey: LibraryDetailsRoute.$parentNavigatorKey,
                  factory: $LibraryDetailsRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationRoutesExtension on NotificationRoutes {
  static NotificationRoutes _fromState(GoRouterState state) =>
      const NotificationRoutes();

  String get location => GoRouteData.$location(
        '/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationDetailRoutesExtension on NotificationDetailRoutes {
  static NotificationDetailRoutes _fromState(GoRouterState state) =>
      NotificationDetailRoutes(
        notiId: state.pathParameters['notiId']!,
      );

  String get location => GoRouteData.$location(
        '/notifications/${Uri.encodeComponent(notiId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $OfflineCoursesRouteExtension on OfflineCoursesRoute {
  static OfflineCoursesRoute _fromState(GoRouterState state) =>
      OfflineCoursesRoute();

  String get location => GoRouteData.$location(
        '/offline-courses',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChatGPTDetailRouteExtension on ChatGPTDetailRoute {
  static ChatGPTDetailRoute _fromState(GoRouterState state) =>
      const ChatGPTDetailRoute();

  String get location => GoRouteData.$location(
        '/chat-gpt',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CommunityVideoListRouteExtension on CommunityVideoListRoute {
  static CommunityVideoListRoute _fromState(GoRouterState state) =>
      const CommunityVideoListRoute();

  String get location => GoRouteData.$location(
        '/community-video-list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CommunityVideoDetailRouteExtension on CommunityVideoDetailRoute {
  static CommunityVideoDetailRoute _fromState(GoRouterState state) =>
      CommunityVideoDetailRoute(
        videoId: state.pathParameters['videoId']!,
      );

  String get location => GoRouteData.$location(
        '/videos/${Uri.encodeComponent(videoId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MyCoursesRouteExtension on MyCoursesRoute {
  static MyCoursesRoute _fromState(GoRouterState state) => MyCoursesRoute();

  String get location => GoRouteData.$location(
        '/my-courses',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GroupRouteExtension on GroupRoute {
  static GroupRoute _fromState(GoRouterState state) => GroupRoute();

  String get location => GoRouteData.$location(
        '/group',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BlogRouteExtension on BlogRoute {
  static BlogRoute _fromState(GoRouterState state) => BlogRoute();

  String get location => GoRouteData.$location(
        '/blog-posts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostDetailsRouteExtension on PostDetailsRoute {
  static PostDetailsRoute _fromState(GoRouterState state) => PostDetailsRoute(
        postId: state.pathParameters['postId']!,
      );

  String get location => GoRouteData.$location(
        '/blog-posts/${Uri.encodeComponent(postId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostQuizRouteExtension on PostQuizRoute {
  static PostQuizRoute _fromState(GoRouterState state) => PostQuizRoute(
        postId: state.pathParameters['postId']!,
        isRetake: _$convertMapValue(
                'is-retake', state.uri.queryParameters, _$boolConverter) ??
            false,
      );

  String get location => GoRouteData.$location(
        '/blog-posts/${Uri.encodeComponent(postId)}/quiz',
        queryParams: {
          if (isRetake != false) 'is-retake': isRetake.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostQuizResultRouteExtension on PostQuizResultRoute {
  static PostQuizResultRoute _fromState(GoRouterState state) =>
      PostQuizResultRoute(
        postId: state.pathParameters['postId']!,
        $extra: state.extra as PostQuizResultExtra?,
      );

  String get location => GoRouteData.$location(
        '/blog-posts/${Uri.encodeComponent(postId)}/quiz/result',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $TagPostsRouteExtension on TagPostsRoute {
  static TagPostsRoute _fromState(GoRouterState state) => TagPostsRoute(
        tagId: state.pathParameters['tagId']!,
        tagName: state.uri.queryParameters['tag-name'],
      );

  String get location => GoRouteData.$location(
        '/blog-posts/tags/${Uri.encodeComponent(tagId)}/posts',
        queryParams: {
          if (tagName != null) 'tag-name': tagName,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LibraryRouteExtension on LibraryRoute {
  static LibraryRoute _fromState(GoRouterState state) => LibraryRoute();

  String get location => GoRouteData.$location(
        '/library',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LibraryDetailsRouteExtension on LibraryDetailsRoute {
  static LibraryDetailsRoute _fromState(GoRouterState state) =>
      LibraryDetailsRoute(
        resourceId: state.pathParameters['resourceId']!,
        $extra: state.extra as Resource?,
      );

  String get location => GoRouteData.$location(
        '/library/${Uri.encodeComponent(resourceId)}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      parentNavigatorKey: LoginRoute.$parentNavigatorKey,
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
        fromPage: state.uri.queryParameters['from-page'],
      );

  String get location => GoRouteData.$location(
        '/login',
        queryParams: {
          if (fromPage != null) 'from-page': fromPage,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/register',
      parentNavigatorKey: RegisterRoute.$parentNavigatorKey,
      factory: $RegisterRouteExtension._fromState,
    );

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  String get location => GoRouteData.$location(
        '/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $forgotPasswordRoute => GoRouteData.$route(
      path: '/forgot-password',
      parentNavigatorKey: ForgotPasswordRoute.$parentNavigatorKey,
      factory: $ForgotPasswordRouteExtension._fromState,
    );

extension $ForgotPasswordRouteExtension on ForgotPasswordRoute {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      const ForgotPasswordRoute();

  String get location => GoRouteData.$location(
        '/forgot-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $resetPasswordRoute => GoRouteData.$route(
      path: '/reset-password',
      parentNavigatorKey: ResetPasswordRoute.$parentNavigatorKey,
      factory: $ResetPasswordRouteExtension._fromState,
    );

extension $ResetPasswordRouteExtension on ResetPasswordRoute {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      ResetPasswordRoute(
        credential: state.uri.queryParameters['credential']!,
        otp: state.uri.queryParameters['otp']!,
      );

  String get location => GoRouteData.$location(
        '/reset-password',
        queryParams: {
          'credential': credential,
          'otp': otp,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $otpVerificationRoute => GoRouteData.$route(
      path: '/otp-verification',
      parentNavigatorKey: OtpVerificationRoute.$parentNavigatorKey,
      factory: $OtpVerificationRouteExtension._fromState,
    );

extension $OtpVerificationRouteExtension on OtpVerificationRoute {
  static OtpVerificationRoute _fromState(GoRouterState state) =>
      OtpVerificationRoute(
        credential: state.uri.queryParameters['credential']!,
        verificationContext: _$OtpVerificationContextEnumMap
            ._$fromName(state.uri.queryParameters['verification-context']!),
      );

  String get location => GoRouteData.$location(
        '/otp-verification',
        queryParams: {
          'credential': credential,
          'verification-context':
              _$OtpVerificationContextEnumMap[verificationContext],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$OtpVerificationContextEnumMap = {
  OtpVerificationContext.register: 'register',
  OtpVerificationContext.login: 'login',
  OtpVerificationContext.resetPassword: 'reset-password',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $authSuccessRoute => GoRouteData.$route(
      path: '/auth-success',
      parentNavigatorKey: AuthSuccessRoute.$parentNavigatorKey,
      factory: $AuthSuccessRouteExtension._fromState,
    );

extension $AuthSuccessRouteExtension on AuthSuccessRoute {
  static AuthSuccessRoute _fromState(GoRouterState state) => AuthSuccessRoute(
        message: state.uri.queryParameters['message']!,
      );

  String get location => GoRouteData.$location(
        '/auth-success',
        queryParams: {
          'message': message,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $groupFeedRoutes => GoRouteData.$route(
      path: '/group-feed/:groupId',
      factory: $GroupFeedRoutesExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'me',
          factory: $GroupUserProfileRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'pending-posts',
          factory: $GroupPendingPostsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'posts/new',
          factory: $PostCreateRoutesExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'pending',
              factory: $GroupPendingPostRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'posts/:postId',
          factory: $ThematicGroupPostDetailRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'edit',
              factory: $EditPostRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $GroupFeedRoutesExtension on GroupFeedRoutes {
  static GroupFeedRoutes _fromState(GoRouterState state) => GroupFeedRoutes(
        groupId: state.pathParameters['groupId']!,
      );

  String get location => GoRouteData.$location(
        '/group-feed/${Uri.encodeComponent(groupId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GroupUserProfileRouteExtension on GroupUserProfileRoute {
  static GroupUserProfileRoute _fromState(GoRouterState state) =>
      GroupUserProfileRoute(
        groupId: state.pathParameters['groupId']!,
      );

  String get location => GoRouteData.$location(
        '/group-feed/${Uri.encodeComponent(groupId)}/me',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GroupPendingPostsRouteExtension on GroupPendingPostsRoute {
  static GroupPendingPostsRoute _fromState(GoRouterState state) =>
      GroupPendingPostsRoute(
        groupId: state.pathParameters['groupId']!,
      );

  String get location => GoRouteData.$location(
        '/group-feed/${Uri.encodeComponent(groupId)}/pending-posts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostCreateRoutesExtension on PostCreateRoutes {
  static PostCreateRoutes _fromState(GoRouterState state) => PostCreateRoutes(
        groupId: state.pathParameters['groupId']!,
      );

  String get location => GoRouteData.$location(
        '/group-feed/${Uri.encodeComponent(groupId)}/posts/new',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GroupPendingPostRouteExtension on GroupPendingPostRoute {
  static GroupPendingPostRoute _fromState(GoRouterState state) =>
      GroupPendingPostRoute(
        groupId: state.pathParameters['groupId']!,
        $extra: state.extra as GroupPendingPostData?,
      );

  String get location => GoRouteData.$location(
        '/group-feed/${Uri.encodeComponent(groupId)}/posts/new/pending',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $ThematicGroupPostDetailRouteExtension
    on ThematicGroupPostDetailRoute {
  static ThematicGroupPostDetailRoute _fromState(GoRouterState state) =>
      ThematicGroupPostDetailRoute(
        postId: state.pathParameters['postId']!,
        groupId: state.pathParameters['groupId']!,
      );

  String get location => GoRouteData.$location(
        '/group-feed/${Uri.encodeComponent(groupId)}/posts/${Uri.encodeComponent(postId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditPostRouteExtension on EditPostRoute {
  static EditPostRoute _fromState(GoRouterState state) => EditPostRoute(
        groupId: state.pathParameters['groupId']!,
        postId: state.pathParameters['postId']!,
        $extra: state.extra as ThematicGroupPost,
      );

  String get location => GoRouteData.$location(
        '/group-feed/${Uri.encodeComponent(groupId)}/posts/${Uri.encodeComponent(postId)}/edit',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $helpRoute => GoRouteData.$route(
      path: '/help',
      factory: $HelpRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'cms',
          factory: $CmsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'faq',
          factory: $FAQRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'user-manual',
          factory: $UserManualRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contact-us',
          factory: $ContactUsRouteExtension._fromState,
        ),
      ],
    );

extension $HelpRouteExtension on HelpRoute {
  static HelpRoute _fromState(GoRouterState state) => const HelpRoute();

  String get location => GoRouteData.$location(
        '/help',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CmsRouteExtension on CmsRoute {
  static CmsRoute _fromState(GoRouterState state) => CmsRoute(
        title: state.uri.queryParameters['title']!,
        url: state.uri.queryParameters['url']!,
      );

  String get location => GoRouteData.$location(
        '/help/cms',
        queryParams: {
          'title': title,
          'url': url,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FAQRouteExtension on FAQRoute {
  static FAQRoute _fromState(GoRouterState state) => const FAQRoute();

  String get location => GoRouteData.$location(
        '/help/faq',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UserManualRouteExtension on UserManualRoute {
  static UserManualRoute _fromState(GoRouterState state) =>
      const UserManualRoute();

  String get location => GoRouteData.$location(
        '/help/user-manual',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ContactUsRouteExtension on ContactUsRoute {
  static ContactUsRoute _fromState(GoRouterState state) =>
      const ContactUsRoute();

  String get location => GoRouteData.$location(
        '/help/contact-us',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $courseListRoute => GoRouteData.$route(
      path: '/courses',
      factory: $CourseListRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':courseId',
          factory: $CourseDetailRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'dashboard',
              factory: $CourseDashboardRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'x-api',
              factory: $XApiCourseRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'intro',
              factory: $CourseIntroRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'lectures/:lectureId',
              factory: $LectureRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'evaluation',
              factory: $CourseEvaluationRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'assessments',
              factory: $AssessmentRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'quizzes/:quizId',
              factory: $CourseQuizRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'live_sessions/:liveSessionId',
              factory: $CourseLiveSessionRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'summaries/:summaryId',
              factory: $CourseSummaryRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'learning_activities/:activityId',
              factory: $LearningActivityRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'completed',
              factory: $CourseCompletionRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $CourseListRouteExtension on CourseListRoute {
  static CourseListRoute _fromState(GoRouterState state) => CourseListRoute(
        $extra: state.extra as CourseCategory?,
      );

  String get location => GoRouteData.$location(
        '/courses',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $CourseDetailRouteExtension on CourseDetailRoute {
  static CourseDetailRoute _fromState(GoRouterState state) => CourseDetailRoute(
        courseId: state.pathParameters['courseId']!,
        isEnrolled: _$convertMapValue(
                'is-enrolled', state.uri.queryParameters, _$boolConverter) ??
            false,
        isOfflineMode: _$convertMapValue('is-offline-mode',
                state.uri.queryParameters, _$boolConverter) ??
            false,
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}',
        queryParams: {
          if (isEnrolled != false) 'is-enrolled': isEnrolled.toString(),
          if (isOfflineMode != false)
            'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseDashboardRouteExtension on CourseDashboardRoute {
  static CourseDashboardRoute _fromState(GoRouterState state) =>
      CourseDashboardRoute(
        courseId: state.pathParameters['courseId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/dashboard',
        queryParams: {
          'learner-id': learnerId,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $XApiCourseRouteExtension on XApiCourseRoute {
  static XApiCourseRoute _fromState(GoRouterState state) => XApiCourseRoute(
        courseId: state.pathParameters['courseId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/x-api',
        queryParams: {
          'learner-id': learnerId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseIntroRouteExtension on CourseIntroRoute {
  static CourseIntroRoute _fromState(GoRouterState state) => CourseIntroRoute(
        courseId: state.pathParameters['courseId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/intro',
        queryParams: {
          'learner-id': learnerId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LectureRouteExtension on LectureRoute {
  static LectureRoute _fromState(GoRouterState state) => LectureRoute(
        courseId: state.pathParameters['courseId']!,
        lectureId: state.pathParameters['lectureId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/lectures/${Uri.encodeComponent(lectureId)}',
        queryParams: {
          'learner-id': learnerId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseEvaluationRouteExtension on CourseEvaluationRoute {
  static CourseEvaluationRoute _fromState(GoRouterState state) =>
      CourseEvaluationRoute(
        courseId: state.pathParameters['courseId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/evaluation',
        queryParams: {
          'learner-id': learnerId,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AssessmentRouteExtension on AssessmentRoute {
  static AssessmentRoute _fromState(GoRouterState state) => AssessmentRoute(
        courseId: state.pathParameters['courseId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        assessmentId: state.uri.queryParameters['assessment-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/assessments',
        queryParams: {
          'learner-id': learnerId,
          'assessment-id': assessmentId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseQuizRouteExtension on CourseQuizRoute {
  static CourseQuizRoute _fromState(GoRouterState state) => CourseQuizRoute(
        courseId: state.pathParameters['courseId']!,
        quizId: state.pathParameters['quizId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/quizzes/${Uri.encodeComponent(quizId)}',
        queryParams: {
          'learner-id': learnerId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseLiveSessionRouteExtension on CourseLiveSessionRoute {
  static CourseLiveSessionRoute _fromState(GoRouterState state) =>
      CourseLiveSessionRoute(
        courseId: state.pathParameters['courseId']!,
        liveSessionId: state.pathParameters['liveSessionId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/live_sessions/${Uri.encodeComponent(liveSessionId)}',
        queryParams: {
          'learner-id': learnerId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseSummaryRouteExtension on CourseSummaryRoute {
  static CourseSummaryRoute _fromState(GoRouterState state) =>
      CourseSummaryRoute(
        courseId: state.pathParameters['courseId']!,
        summaryId: state.pathParameters['summaryId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/summaries/${Uri.encodeComponent(summaryId)}',
        queryParams: {
          'learner-id': learnerId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LearningActivityRouteExtension on LearningActivityRoute {
  static LearningActivityRoute _fromState(GoRouterState state) =>
      LearningActivityRoute(
        courseId: state.pathParameters['courseId']!,
        activityId: state.pathParameters['activityId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
        materialKey: state.uri.queryParameters['material-key']!,
        isOfflineMode:
            _$boolConverter(state.uri.queryParameters['is-offline-mode']!),
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/learning_activities/${Uri.encodeComponent(activityId)}',
        queryParams: {
          'learner-id': learnerId,
          'material-key': materialKey,
          'is-offline-mode': isOfflineMode.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CourseCompletionRouteExtension on CourseCompletionRoute {
  static CourseCompletionRoute _fromState(GoRouterState state) =>
      CourseCompletionRoute(
        courseId: state.pathParameters['courseId']!,
        learnerId: state.uri.queryParameters['learner-id']!,
      );

  String get location => GoRouteData.$location(
        '/courses/${Uri.encodeComponent(courseId)}/completed',
        queryParams: {
          'learner-id': learnerId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
      path: '/profile',
      factory: $ProfileRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'edit',
          factory: $EditProfileRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'change-password',
          factory: $ChangePasswordRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'success',
              factory: $ChangePasswordSuccessRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditProfileRouteExtension on EditProfileRoute {
  static EditProfileRoute _fromState(GoRouterState state) =>
      const EditProfileRoute();

  String get location => GoRouteData.$location(
        '/profile/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChangePasswordRouteExtension on ChangePasswordRoute {
  static ChangePasswordRoute _fromState(GoRouterState state) =>
      const ChangePasswordRoute();

  String get location => GoRouteData.$location(
        '/profile/change-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChangePasswordSuccessRouteExtension on ChangePasswordSuccessRoute {
  static ChangePasswordSuccessRoute _fromState(GoRouterState state) =>
      ChangePasswordSuccessRoute(
        message: state.uri.queryParameters['message']!,
      );

  String get location => GoRouteData.$location(
        '/profile/change-password/success',
        queryParams: {
          'message': message,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
