import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../bloc/course_reviews_bloc.dart';
import 'course_reviews_screen.dart';

class CourseReviewsScreenEntry extends StatelessWidget {
  const CourseReviewsScreenEntry({
    super.key,
    required this.courseId,
    required this.hasEnrolled,
    required this.isLoggedIn,
    required this.onLoginEvent,
  });

  final String courseId;
  final bool hasEnrolled;
  final bool isLoggedIn;
  final LoginEventEventHandler onLoginEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseReviewsBloc(
        courseId: courseId,
      )..add(const CourseReviewsFetched()),
      child: CourseReviewsScreen(
        courseId: courseId,
        hasEnrolled: hasEnrolled,
        isLoggedIn: isLoggedIn,
        onLoginEvent: onLoginEvent,
      ),
    );
  }
}