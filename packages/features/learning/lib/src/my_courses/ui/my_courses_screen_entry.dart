import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/my_courses/ui/my_courses_screen.dart';
import 'package:ui/ui.dart';

import '../bloc/bloc.dart';

typedef MyCourseItemEventHandler = void Function({
  required String courseId,
});

typedef MyCourseEvaluationEventHandler = void Function({
  required String courseId,
  required String learnerId,
});

typedef ExploreCoursesEventHandler = void Function();

class MyCoursesScreenEntry extends StatelessWidget {
  const MyCoursesScreenEntry({
    super.key,
    required this.drawer,
    required this.scaffoldKey,
    required this.onCourseItemEvent,
    required this.onExploreCoursesEvent,
    required this.onEvaluationEvent,
    required this.onNotiClick,
  });

  final Widget drawer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final MyCourseItemEventHandler onCourseItemEvent;
  final ExploreCoursesEventHandler onExploreCoursesEvent;
  final MyCourseEvaluationEventHandler onEvaluationEvent;
  final NotificationActionClickCallback onNotiClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCoursesBloc()
        ..add(const MyCoursesOngoingCoursesFetched())
        ..add(const MyCoursesCompletedCoursesFetched()),
      child: MyCoursesScreen(
        drawer: drawer,
        scaffoldKey: scaffoldKey,
        onCourseItemEvent: onCourseItemEvent,
        onExploreCoursesEvent: onExploreCoursesEvent,
        onEvaluationEvent: onEvaluationEvent,
        onNotiClick: onNotiClick,
      ),
    );
  }
}
