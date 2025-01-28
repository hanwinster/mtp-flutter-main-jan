import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/common/common.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../bloc/summary_bloc.dart';
import 'components/components.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    super.key,
    required this.courseId,
    required this.navigationEventHandler,
    required this.isOfflineMode,
    required this.onSwitchToOnline,
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
                .read<SummaryBloc>()
                .add(SummaryLearnerChanged(state.learnerUiState));
          },
          child: BlocBuilder<SummaryBloc, SummaryState>(
            buildWhen: (previous, current) =>
                previous.summaryUiState != current.summaryUiState ||
                previous.courseLearnerUiState != current.courseLearnerUiState,
            builder: (context, state) {
              return state.summaryUiState.toSliverView(
                context,
                successViewBuilder: (summary) {
                  final learner = state.courseLearnerUiState.dataOrNull;
                  if (learner == null) {
                    return const SliverToBoxAdapter(
                      child: MtpLoading(),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: SummaryScreenContent(
                      courseId: courseId,
                      summary: summary,
                      learner: learner,
                      isOfflineMode: isOfflineMode,
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
