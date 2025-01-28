import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/bloc/course_navigation/bloc.dart';
import '../bloc/live_session_bloc.dart';
import 'live_session_screen.dart';

class LiveSessionScreenEntry extends StatelessWidget {
  const LiveSessionScreenEntry({
    super.key,
    required this.courseId,
    required this.liveSessionId,
    required this.learnerId,
    required this.materialKey,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final String courseId;
  final String liveSessionId;
  final String learnerId;
  final String materialKey;
  final bool isOfflineMode;
  final SwitchToOnlineEventHandler onSwitchToOnline;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseLearnerBloc(
            learnerId: learnerId,
          )..add(const CourseLearnerFetched()),
        ),
        BlocProvider(
          create: (context) => CourseNavigationBloc(
            courseId: courseId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          ),
        ),
        BlocProvider(
          create: (context) => LiveSessionBloc(
            activityId: liveSessionId,
            courseId: courseId,
            materialKey: materialKey,
          )..add(const LiveSessionFetched()),
        ),
      ],
      child: LiveScreenScreen(
        courseId: courseId,
        navigationEventHandler: navigationEventHandler,
        isOfflineMode: isOfflineMode,
        onSwitchToOnline: onSwitchToOnline,
      ),
    );
  }
}
