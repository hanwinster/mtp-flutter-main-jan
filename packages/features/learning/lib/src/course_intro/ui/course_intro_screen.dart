import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/common.dart';
import '../bloc/course_intro_bloc.dart';
import 'components/components.dart';

class CourseIntroScreen extends StatelessWidget {
  const CourseIntroScreen({
    super.key,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final bool isOfflineMode;
  final Function() onSwitchToOnline;
  final CourseNavigationEventHandler navigationEventHandler;

  @override
  Widget build(BuildContext context) {
    return LearningScreenScaffold(
      navigationEventHandler: navigationEventHandler,
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: onSwitchToOnline,
      slivers: [
        BlocListener<CourseLearnerBloc, CourseLearnerState>(
          listenWhen: (previous, current) =>
              previous.learnerUiState != current.learnerUiState,
          listener: (context, state) {
            context
                .read<CourseIntroBloc>()
                .add(CourseIntroLearnerChanged(state.learnerUiState));
          },
          child: BlocBuilder<CourseIntroBloc, CourseIntroState>(
            buildWhen: (previous, current) =>
                previous.courseUiState != current.courseUiState ||
                previous.courseLearnerUiState != current.courseLearnerUiState,
            builder: (context, state) {
              return state.courseUiState.toSliverView(
                context,
                successViewBuilder: (course) {
                  final learner = state.courseLearnerUiState.dataOrNull;
                  if (learner == null) {
                    return const SliverToBoxAdapter(
                      child: MtpLoading(),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: CourseIntroContent(
                      course: course,
                      learner: learner,
                      materialKey: state.materialKey,
                      navigationEventHandler: navigationEventHandler,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
