import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/bloc/course_navigation/bloc.dart';
import '../bloc/quiz_bloc.dart';
import 'quiz_screen.dart';

class QuizScreenEntry extends StatelessWidget {
  const QuizScreenEntry({
    super.key,
    required this.courseId,
    required this.learnerId,
    required this.quizId,
    required this.materialKey,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final String courseId;
  final String learnerId;
  final String quizId;
  final String materialKey;
  final bool isOfflineMode;
  final SwitchToOnlineEventHandler onSwitchToOnline;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseLearnerBloc(
            learnerId: learnerId,
          )..add(const CourseLearnerFetched()),
        ),
        BlocProvider(
          create: (context) => CourseNavigationBloc(
            courseId: courseId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          ),
        ),
        BlocProvider(
          create: (context) => QuizBloc(
            courseId: courseId,
            quizId: quizId,
            materialKey: materialKey,
            isOfflineMode: isOfflineMode,
          )..add(const QuizFetched()),
        ),
      ],
      child: QuizScreen(
        navigationEventHandler: navigationEventHandler,
        isOfflineMode: isOfflineMode,
        onSwitchToOnline: onSwitchToOnline,
      ),
    );
  }
}
