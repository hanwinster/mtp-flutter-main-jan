import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/common.dart';
import '../bloc/learning_activity_bloc.dart';
import 'components/components.dart';

class LearningActivityScreen extends StatelessWidget {
  const LearningActivityScreen({
    super.key,
    required this.courseId,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
    required this.navigationEventHandler,
  });

  final String courseId;
  final bool isOfflineMode;
  final SwitchToOnlineEventHandler onSwitchToOnline;
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
                .read<LearningActivityBloc>()
                .add(LearningActivityLearnerChanged(state.learnerUiState));
          },
          child: BlocBuilder<LearningActivityBloc, LearningActivityState>(
            buildWhen: (previous, current) =>
                previous.activitiesUiState != current.activitiesUiState ||
                previous.courseLearnerUiState != current.courseLearnerUiState,
            builder: (context, state) {
              return state.activitiesUiState.toSliverView(
                context,
                successViewBuilder: (activity) {
                  final learner = state.courseLearnerUiState.dataOrNull;
                  if (learner == null) {
                    return const SliverToBoxAdapter(
                      child: MtpLoading(),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: LearningActivityContent(
                      courseId: courseId,
                      learner: learner,
                      activity: activity,
                      materialKey: state.materialKey,
                      navigationEventHandler: navigationEventHandler,
                      isOfflineMode: isOfflineMode,
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
