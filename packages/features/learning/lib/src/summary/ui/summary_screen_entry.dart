import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/bloc/course_navigation/bloc.dart';
import '../bloc/summary_bloc.dart';
import 'summary_screen.dart';

class SummaryScreenEntry extends StatelessWidget {
  const SummaryScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.summaryId,
    required this.materialKey,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final String courseId;
  final String learnerId;
  final String summaryId;
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
          create: (context) => SummaryBloc(
            courseId: courseId,
            summaryId: summaryId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          )..add(const SummaryFetched()),
        ),
      ],
      child: SummaryScreen(
        courseId: courseId,
        navigationEventHandler: navigationEventHandler,
        isOfflineMode: isOfflineMode,
        onSwitchToOnline: onSwitchToOnline,
      ),
    );
  }
}
