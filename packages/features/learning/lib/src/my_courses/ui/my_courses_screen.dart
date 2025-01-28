import 'package:flutter/material.dart';
import 'package:ui/ui.dart';
import 'components/components.dart';
import 'my_courses_screen_entry.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({
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
    return Scaffold(
      drawer: drawer,
      key: scaffoldKey,
      appBar: buildMtpPrimaryAppBar(
        context,
        scaffoldKey,
        actions: [
          NotificationActionButton(
            onClicked: onNotiClick,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Grid.two,
        ),
        child: CourseListContent(
          onCourseItemEvent: onCourseItemEvent,
          onExploreCoursesEvent: onExploreCoursesEvent,
          onEvaluationEvent: onEvaluationEvent,
        ),
      ),
    );
  }
}
