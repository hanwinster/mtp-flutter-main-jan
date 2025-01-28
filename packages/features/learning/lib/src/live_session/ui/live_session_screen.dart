import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/common.dart';
import '../bloc/live_session_bloc.dart';
import 'components/components.dart';

class LiveScreenScreen extends StatelessWidget {
  const LiveScreenScreen({
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
                .read<LiveSessionBloc>()
                .add(LiveSessionLearnerChanged(state.learnerUiState));
          },
          child: BlocBuilder<LiveSessionBloc, LiveSessionState>(
            buildWhen: (previous, current) =>
                previous.liveSessionUiState != current.liveSessionUiState ||
                previous.courseLearnerUiState != current.courseLearnerUiState,
            builder: (context, state) {
              return state.liveSessionUiState.toSliverView(
                context,
                successViewBuilder: (liveSession) {
                  final learner = state.courseLearnerUiState.dataOrNull;
                  if (learner == null) {
                    return const SliverToBoxAdapter(
                      child: MtpLoading(),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: LiveSessionContent(
                      courseId: courseId,
                      learner: learner,
                      liveSession: liveSession,
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
