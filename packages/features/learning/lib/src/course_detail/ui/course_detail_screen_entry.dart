import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';
import '../bloc/course_detail_bloc.dart';
import 'course_detail_screen.dart';

typedef LoginEventEventHandler = Future<bool> Function();

typedef LaunchCourseEventHandler = void Function({
  required String courseId,
  required String learnerId,
});

typedef GoToOfflineCoursesEventHandler = void Function({
  required String courseId,
});

class CourseDetailScreenEntry extends StatelessWidget {
  const CourseDetailScreenEntry({
    super.key,
    required this.courseId,
    required this.isEnrolled,
    required this.isLoggedIn,
    required this.isOfflineMode,
    required this.onLaunchCourseEvent,
    required this.goToOfflineCoursesEvent,
    required this.onLoginEvent,
  });

  final String courseId;
  final bool isEnrolled;
  final bool isOfflineMode;
  final bool isLoggedIn;
  final LaunchCourseEventHandler onLaunchCourseEvent;
  final GoToOfflineCoursesEventHandler goToOfflineCoursesEvent;
  final LoginEventEventHandler onLoginEvent;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseDetailBloc(
            courseId: courseId,
            isEnrolled: isEnrolled,
            isOfflineMode: isOfflineMode,
          )
            ..add(CourseDetailFetched(courseId))
            ..add(CourseDetailDownloadStatusFetched(courseId)),
        ),
        BlocProvider(
          create: (context) => CertificateDownloaderBloc(),
        ),
      ],
      child: CourseDetailScreen(
        courseId: courseId,
        isLoggedIn: isLoggedIn,
        onLaunchCourseEvent: onLaunchCourseEvent,
        onGoToOfflineCoursesEvent: goToOfflineCoursesEvent,
        onLoginEvent: onLoginEvent,
      ),
    );
  }
}
