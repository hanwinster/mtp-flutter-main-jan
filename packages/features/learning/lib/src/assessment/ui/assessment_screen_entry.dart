import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/bloc/course_navigation/bloc.dart';
import '../bloc/assessment_bloc.dart';
import 'assessment_screen.dart';

class AssessmentScreenEntry extends StatelessWidget {
  const AssessmentScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.assessmentId,
    required this.materialKey,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final String courseId;
  final String learnerId;
  final String assessmentId;
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
          create: (context) => AssessmentBloc(
            courseId: courseId,
            materialKey: materialKey,
            assessmentId: assessmentId,
            isOfflineMode: isOfflineMode,
          )..add(const AssessmentQuestionFetched()),
        ),
      ],
      child: AssessmentScreen(
        isOfflineMode: isOfflineMode,
        onSwitchToOnline: onSwitchToOnline,
        navigationEventHandler: navigationEventHandler,
      ),
    );
  }
}
