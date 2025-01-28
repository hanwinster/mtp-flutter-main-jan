import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../bloc/bloc.dart';
import 'course_dashboard_screen.dart';

class CourseDashboardScreenEntry extends StatelessWidget {
  const CourseDashboardScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.isOfflineLearningMode,
    required this.courseNavigationEventHandler,
    required this.onSwitchToOnline,
  });

  final String courseId;
  final String learnerId;
  final bool isOfflineLearningMode;
  final CourseNavigationEventHandler courseNavigationEventHandler;
  final SwitchToOnlineEventHandler onSwitchToOnline;

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
          create: (context) => CourseDashboardBloc(
            courseId: courseId,
          )..add(CourseDashboardCourseFetched(courseId)),
        ),
      ],
      child: CourseDashboardScreen(
        isOfflineLearningMode: isOfflineLearningMode,
        navigationEventHandler: courseNavigationEventHandler,
        onSwitchToOnline: onSwitchToOnline,
      ),
    );
  }
}
