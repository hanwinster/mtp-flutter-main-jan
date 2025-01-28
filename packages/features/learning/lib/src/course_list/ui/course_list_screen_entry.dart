import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/course_list_bloc.dart';
import 'course_list_screen.dart';

typedef CourseItemEventHandler = void Function({
  required String courseId,
});

class CourseListScreenEntry extends StatelessWidget {
  const CourseListScreenEntry({
    super.key,
    required this.filter,
    required this.onCourseItemEvent,
  });

  final CourseFilter filter;
  final CourseItemEventHandler onCourseItemEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CourseListBloc(filter: filter),
      child: CourseListScreen(
        onCourseItemEvent: onCourseItemEvent,
      ),
    );
  }
}
