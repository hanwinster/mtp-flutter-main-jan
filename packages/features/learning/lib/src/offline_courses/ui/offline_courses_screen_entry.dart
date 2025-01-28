import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/offline_courses_bloc.dart';
import 'offline_courses_screen.dart';

typedef OfflineCourseClickCallback = void Function({
  required String courseId,
});

typedef OfflineCourseMediaClickCallback = void Function({
  required String url,
});

typedef RemoveOfflineCourseCallback = void Function({
  required String courseId,
});

typedef RemoveOfflineCourseMediaCallback = void Function({
required String offlineCourseMediaId,
});

class OfflineCoursesScreenEntry extends StatelessWidget {
  const OfflineCoursesScreenEntry({
    super.key,
    required this.onCourseClick,
  });

  final OfflineCourseClickCallback onCourseClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OfflineCoursesBloc()
        ..add(const OfflineCoursesFetched())
        ..add(const OfflineCourseMediasFetched()),
      child: OfflineCoursesScreen(
        onCourseClick: onCourseClick,
      ),
    );
  }
}
