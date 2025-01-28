import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/bloc/course_navigation/bloc.dart';
import '../bloc/lecture_bloc.dart';
import 'lecture_screen.dart';

class LectureScreenEntry extends StatelessWidget {
  const LectureScreenEntry({
    super.key,
    required this.courseId,
    required this.lectureId,
    required this.learnerId,
    required this.materialKey,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final String courseId;
  final String lectureId;
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
            isOfflineMode: isOfflineMode
          ),
        ),
        BlocProvider(
          create: (context) => LectureBloc(
            lectureId: lectureId,
            courseId: courseId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          )..add(const LectureFetched()),
        ),
      ],
      child: LectureScreen(
        courseId: courseId,
        navigationEventHandler: navigationEventHandler,
        isOfflineMode: isOfflineMode,
        onSwitchToOnline: onSwitchToOnline,
      ),
    );
  }
}
