import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/common/bloc/course_learner/bloc.dart';
import 'package:learning/src/common/bloc/course_navigation/bloc.dart';

import '../bloc/course_intro_bloc.dart';
import 'course_intro_screen.dart';

class CourseIntroScreenEntry extends StatelessWidget {
  const CourseIntroScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.materialKey,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final String courseId;
  final String learnerId;
  final String materialKey;
  final bool isOfflineMode;
  final Function() onSwitchToOnline;
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
          create: (context) => CourseIntroBloc(
            courseId: courseId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          )..add(const CourseIntroCourseFetched()),
        ),
      ],
      child: CourseIntroScreen(
        isOfflineMode: isOfflineMode,
        onSwitchToOnline: onSwitchToOnline,
        navigationEventHandler: navigationEventHandler,
      ),
    );
  }
}
