import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';

import 'components.dart';

class CourseDashboardContent extends StatelessWidget {
  const CourseDashboardContent({
    super.key,
    required this.course,
    required this.navigationEventHandler,
  });

  final Course course;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    if (course.isXapiCourse) {
      return XApiCourseDashboardContent(
        course: course,
        navigationEventHandler: navigationEventHandler,
      );
    }

    if (course.courseOrderType == CourseMaterialOrderType.flexible) {
      return FlexibleOrderCourseDashboardContent(
        course: course,
        navigationEventHandler: navigationEventHandler,
      );
    } else {
      return DefaultOrderCourseDashboardContent(
        course: course,
        navigationEventHandler: navigationEventHandler,
      );
    }
  }
}
