part of '../app_shell_routes.dart';

class MyCoursesRoute extends GoRouteData {
  MyCoursesRoute();

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey(debugLabel: 'MyCoursesScaffoldKey');

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.authState != current.authState,
      builder: (context, state) {
        if (state.isLoggedIn) {
          return MyCoursesScreenEntry(
            drawer: MtpAppDrawer(
              scaffoldKey: scaffoldKey,
            ),
            scaffoldKey: scaffoldKey,
            onCourseItemEvent: ({
              required String courseId,
            }) {
              _navigateToCourseDetail(
                context,
                courseId: courseId,
                isEnrolled: true,
                isOfflineMode: false,
              );
            },
            onExploreCoursesEvent: () {
              navigateToCourseList(context);
            },
            onEvaluationEvent: ({
              required String courseId,
              required String learnerId,
            }) {
              CourseEvaluationRoute(
                courseId: courseId,
                learnerId: learnerId,
                isOfflineMode: false,
              ).push(context);
            },
            onNotiClick: () {
              navigateToNotificationsList(context);
            },
          );
        } else {
          return CourseGuestUserScreenEntry(
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

@TypedGoRoute<CourseListRoute>(path: '/courses', routes: [
  TypedGoRoute<CourseDetailRoute>(path: ':courseId', routes: [
    TypedGoRoute<CourseDashboardRoute>(
      path: 'dashboard',
    ),
    TypedGoRoute<XApiCourseRoute>(
      path: 'x-api',
    ),
    TypedGoRoute<CourseIntroRoute>(
      path: 'intro',
    ),
    TypedGoRoute<LectureRoute>(
      path: 'lectures/:lectureId',
    ),
    TypedGoRoute<CourseEvaluationRoute>(
      path: 'evaluation',
    ),
    TypedGoRoute<AssessmentRoute>(
      path: 'assessments',
    ),
    TypedGoRoute<CourseQuizRoute>(
      path: 'quizzes/:quizId',
    ),
    TypedGoRoute<CourseLiveSessionRoute>(
      path: 'live_sessions/:liveSessionId',
    ),
    TypedGoRoute<CourseSummaryRoute>(
      path: 'summaries/:summaryId',
    ),
    TypedGoRoute<LearningActivityRoute>(
      path: 'learning_activities/:activityId',
    ),
    TypedGoRoute<CourseCompletionRoute>(
      path: 'completed',
    ),
  ]),
])
class CourseListRoute extends GoRouteData {
  const CourseListRoute({
    this.$extra,
  });

  final CourseCategory? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final filter = CourseFilter(
      category: $extra,
    );
    return CourseListScreenEntry(
      filter: filter,
      onCourseItemEvent: ({required String courseId}) {
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

class CourseDetailRoute extends GoRouteData {
  const CourseDetailRoute({
    required this.courseId,
    this.isEnrolled = false,
    this.isOfflineMode = false,
  });

  final String courseId;
  final bool isEnrolled;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.authState != current.authState,
        builder: (context, state) {
          return CourseDetailScreenEntry(
            courseId: courseId,
            isEnrolled: isEnrolled,
            isOfflineMode: isOfflineMode,
            isLoggedIn: state.isLoggedIn,
            onLaunchCourseEvent: ({
              required String courseId,
              required String learnerId,
            }) {
              CourseDashboardRoute(
                courseId: courseId,
                learnerId: learnerId,
                isOfflineMode: isOfflineMode,
              ).push(context);
            },
            goToOfflineCoursesEvent: ({
              required String courseId,
            }) {
              OfflineCoursesRoute().push(context);
            },
            onLoginEvent: () async {
              final result = await navigateToLoginWithResult(context);
              return result;
            },
          );
        });
  }
}

class CourseDashboardRoute extends GoRouteData {
  const CourseDashboardRoute({
    required this.courseId,
    required this.learnerId,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final bool isOfflineMode;

  static String buildLocation({required String courseId}) {
    return '/courses/${Uri.encodeComponent(courseId)}/lectures';
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CourseDashboardScreenEntry(
        courseId: courseId,
        learnerId: learnerId,
        isOfflineLearningMode: isOfflineMode,
        courseNavigationEventHandler: GoRouterCourseEventHandler(
          context: context,
          courseId: courseId,
          learnerId: learnerId,
          isOfflineMode: isOfflineMode,
        ),
        onSwitchToOnline: () {
          _handleSwitchToOnlineLearningMode(context);
        });
  }
}

class XApiCourseRoute extends GoRouteData {
  const XApiCourseRoute({
    required this.courseId,
    required this.learnerId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return XApiCourseScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
      courseNavigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class CourseIntroRoute extends GoRouteData {
  const CourseIntroRoute({
    required this.courseId,
    required this.learnerId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CourseIntroScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: () {
        _handleSwitchToOnlineLearningMode(context);
      },
      navigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class LectureRoute extends GoRouteData {
  const LectureRoute({
    required this.courseId,
    required this.learnerId,
    required this.lectureId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String lectureId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LectureScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      lectureId: lectureId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: () {
        _handleSwitchToOnlineLearningMode(context);
      },
      navigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class CourseQuizRoute extends GoRouteData {
  const CourseQuizRoute({
    required this.courseId,
    required this.learnerId,
    required this.quizId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String quizId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return QuizScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      quizId: quizId,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: () {
        _handleSwitchToOnlineLearningMode(context);
      },
      navigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class CourseLiveSessionRoute extends GoRouteData {
  const CourseLiveSessionRoute({
    required this.courseId,
    required this.learnerId,
    required this.liveSessionId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String liveSessionId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LiveSessionScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      liveSessionId: liveSessionId,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: () {
        _handleSwitchToOnlineLearningMode(context);
      },
      navigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class CourseEvaluationRoute extends GoRouteData {
  const CourseEvaluationRoute({
    required this.courseId,
    required this.learnerId,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EvaluationScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      onCompleteEvent: () {
        CourseCompletionRoute(
          courseId: courseId,
          learnerId: learnerId,
        ).push(context);
      },
    );
  }
}

class LearningActivityRoute extends GoRouteData {
  const LearningActivityRoute({
    required this.courseId,
    required this.learnerId,
    required this.activityId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String activityId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LearningActivityScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      activityId: activityId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: () {
        _handleSwitchToOnlineLearningMode(context);
      },
      navigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class CourseSummaryRoute extends GoRouteData {
  const CourseSummaryRoute({
    required this.courseId,
    required this.learnerId,
    required this.summaryId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String summaryId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SummaryScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      summaryId: summaryId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: () {
        _handleSwitchToOnlineLearningMode(context);
      },
      navigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class AssessmentRoute extends GoRouteData {
  const AssessmentRoute({
    required this.courseId,
    required this.learnerId,
    required this.assessmentId,
    required this.materialKey,
    required this.isOfflineMode,
  });

  final String courseId;
  final String learnerId;
  final String assessmentId;
  final String materialKey;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AssessmentScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      assessmentId: assessmentId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: () {
        _handleSwitchToOnlineLearningMode(context);
      },
      navigationEventHandler: GoRouterCourseEventHandler(
        context: context,
        courseId: courseId,
        learnerId: learnerId,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}

class CourseCompletionRoute extends GoRouteData {
  const CourseCompletionRoute({
    required this.courseId,
    required this.learnerId,
  });

  final String courseId;
  final String learnerId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CourseCompletionScreenEntry(
      courseId: courseId,
      learnerId: learnerId,
      onCloseEvent: () {
        MyCoursesRoute().go(context);
      },
      onMyCourseEvent: () {
        MyCoursesRoute().go(context);
      },
    );
  }
}

void navigateToCourseList(
  BuildContext context, {
  CourseCategory? category,
}) {
  CourseListRoute(
    $extra: category,
  ).push(context);
}

void _navigateToCourseDetail(
  BuildContext context, {
  required String courseId,
  required bool isEnrolled,
  required bool isOfflineMode,
}) {
  CourseDetailRoute(
    courseId: courseId,
    isEnrolled: isEnrolled,
    isOfflineMode: isOfflineMode,
  ).push(context);
}

class GoRouterCourseEventHandler extends CourseNavigationEventHandler {
  GoRouterCourseEventHandler({
    required this.context,
    required this.courseId,
    required this.learnerId,
    required this.isOfflineMode,
  });

  final BuildContext context;
  final String courseId;
  final String learnerId;
  final bool isOfflineMode;

  @override
  void onIntroductionEvent({
    required String materialKey,
    required CourseNavigationDirection direction,
  }) {
    final route = CourseIntroRoute(
      courseId: courseId,
      learnerId: learnerId,
      isOfflineMode: isOfflineMode,
      materialKey: materialKey,
    );
    if (direction == CourseNavigationDirection.previous) {
      route.pushReplacement(context);
    } else {
      route.pushReplacement(context);
    }
  }

  @override
  void onLectureEvent({
    required String lectureId,
    required String materialKey,
    required CourseNavigationDirection direction,
  }) {
    final route = LectureRoute(
      courseId: courseId,
      learnerId: learnerId,
      lectureId: lectureId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
    if (direction == CourseNavigationDirection.previous) {
      route.pushReplacement(context);
    } else {
      route.pushReplacement(context);
    }
  }

  @override
  void onLearningActivityEvent({
    required String activityId,
    required String materialKey,
    required CourseNavigationDirection direction,
  }) {
    final route = LearningActivityRoute(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      activityId: activityId,
      isOfflineMode: isOfflineMode,
    );
    if (direction == CourseNavigationDirection.previous) {
      route.pushReplacement(context);
    } else {
      route.pushReplacement(context);
    }
  }

  @override
  void onQuizEvent({
    required String quizId,
    required String materialKey,
    required CourseNavigationDirection direction,
  }) async {
    final route = CourseQuizRoute(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      quizId: quizId,
      isOfflineMode: isOfflineMode,
    );
    if (direction == CourseNavigationDirection.previous) {
      route.pushReplacement(context);
    } else {
      route.pushReplacement(context);
    }
  }

  @override
  void onLiveSessionEvent({
    required String liveSessionId,
    required String materialKey,
    required CourseNavigationDirection direction,
  }) async {
    final route = CourseLiveSessionRoute(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      liveSessionId: liveSessionId,
      isOfflineMode: isOfflineMode,
    );
    if (direction == CourseNavigationDirection.previous) {
      route.pushReplacement(context);
    } else {
      route.push(context);
    }
  }

  @override
  void onSummaryEvent({
    required String summaryId,
    required String materialKey,
    required CourseNavigationDirection direction,
  }) {
    final route = CourseSummaryRoute(
      courseId: courseId,
      learnerId: learnerId,
      summaryId: summaryId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
    if (direction == CourseNavigationDirection.previous) {
      route.pushReplacement(context);
    } else {
      route.pushReplacement(context);
    }
  }

  @override
  void onAssessmentEvent({
    required String materialKey,
    required String assessmentId,
    required CourseNavigationDirection direction,
  }) {
    final route = AssessmentRoute(
      courseId: courseId,
      learnerId: learnerId,
      assessmentId: assessmentId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
    if (direction == CourseNavigationDirection.previous) {
      route.pushReplacement(context);
    } else {
      route.pushReplacement(context);
    }
  }

  @override
  void onEvaluationEvent() {
    CourseEvaluationRoute(
      courseId: courseId,
      learnerId: learnerId,
      isOfflineMode: isOfflineMode,
    ).pushReplacement(context);
  }

  @override
  void onCloseEvent() {
    Navigator.of(context).pop();
  }

  @override
  void onXApiCourseEvent({
    required String materialKey,
    required CourseNavigationDirection direction,
  }) {
    logger.d('Material Key: $materialKey, Direction: $direction');
    XApiCourseRoute(
      courseId: courseId,
      learnerId: learnerId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    ).pushReplacement(context);
  }
}

void _handleSwitchToOnlineLearningMode(BuildContext context) {
  MyCoursesRoute().go(context);
}
