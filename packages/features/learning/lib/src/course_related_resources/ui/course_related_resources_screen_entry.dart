import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/course_related_resources_bloc.dart';
import 'course_related_resources_screen.dart';

class CourseRelatedResourcesScreenEntry extends StatelessWidget {
  const CourseRelatedResourcesScreenEntry({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseRelatedResourcesBloc(
        courseId: courseId,
      )..add(const CourseRelatedResourcesFetched()),
      child: const CourseRelatedResourcesScreen(),
    );
  }
}