import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/bloc/course_navigation/bloc.dart';
import '../bloc/x_api_course_bloc.dart';
import 'x_api_course_screen.dart';

class XApiCourseScreenEntry extends StatelessWidget {
  const XApiCourseScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.materialKey,
    required this.isOfflineMode,
    required this.courseNavigationEventHandler,
  });

  final String courseId;
  final String learnerId;
  final String materialKey;
  final bool isOfflineMode;
  final CourseNavigationEventHandler courseNavigationEventHandler;

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
          create: (context) => XApiCourseBloc(
            courseId: courseId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          )..add(const XApiCourseFetched()),
        ),
      ],
      child: XApiCourseScreen(
        courseNavigationEventHandler: courseNavigationEventHandler,
      ),
    );
  }
}
