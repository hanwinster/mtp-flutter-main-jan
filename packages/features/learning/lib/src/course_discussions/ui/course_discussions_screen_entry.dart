import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../bloc/course_discussions_bloc.dart';
import 'course_discussions_screen.dart';

class CourseDiscussionsScreenEntry extends StatelessWidget {
  const CourseDiscussionsScreenEntry({
    super.key,
    required this.courseId,
    required this.discussionId,
    required this.hasEnrolled,
    required this.isLoggedIn,
    required this.onLoginEvent,
  });

  final String courseId;
  final String discussionId;
  final bool hasEnrolled;
  final bool isLoggedIn;
  final LoginEventEventHandler onLoginEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseDiscussionsBloc(
        courseId: courseId,
        discussionId: discussionId,
      )..add(const CourseDiscussionsMessagesFetched()),
      child: CourseDiscussionsScreen(
        hasEnrolled: hasEnrolled,
        isLoggedIn: isLoggedIn,
        onLoginEvent: onLoginEvent,
      ),
    );
  }
}