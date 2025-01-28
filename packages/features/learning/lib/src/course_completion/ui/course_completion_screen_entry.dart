import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/common/bloc/certificate_downloader_bloc/certificate_downloader_bloc.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../bloc/course_completion_bloc.dart';
import 'course_completion_screen.dart';

class CourseCompletionScreenEntry extends StatelessWidget {
  const CourseCompletionScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.onCloseEvent,
    required this.onMyCourseEvent,
  });

  final String courseId;
  final String learnerId;
  final Function() onCloseEvent;
  final Function() onMyCourseEvent;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseCompletionBloc(
            courseId: courseId,
          ),
        ),
        BlocProvider(
          create: (context) => CertificateDownloaderBloc(),
        ),
        BlocProvider(
          create: (context) => CourseLearnerBloc(
            learnerId: learnerId,
          )..add(const CourseLearnerFetched()),
        ),
      ],
      child: CourseCompletionScreen(
        onCloseEvent: onCloseEvent,
        onMyCourseEvent: onMyCourseEvent,
      ),
    );
  }
}
