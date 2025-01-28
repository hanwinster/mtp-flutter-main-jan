import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/common/bloc/course_learner/bloc.dart';
import 'package:ui/ui.dart';

import '../../common/common.dart';
import '../bloc/course_dashboard_bloc.dart';
import 'components/components.dart';

class CourseDashboardScreen extends StatelessWidget {
  const CourseDashboardScreen({
    super.key,
    required this.isOfflineLearningMode,
    required this.navigationEventHandler,
    required this.onSwitchToOnline,
  });

  final bool isOfflineLearningMode;
  final CourseNavigationEventHandler navigationEventHandler;
  final SwitchToOnlineEventHandler onSwitchToOnline;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CourseLearnerBloc, CourseLearnerState>(
          listenWhen: (previous, current) =>
              previous.learnerUiState != current.learnerUiState,
          listener: (context, state) {
            context.read<CourseDashboardBloc>().add(
                  CourseDashboardLearnerChanged(state.learnerUiState),
                );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: Grid.two),
          child: Column(
            children: [
              if (isOfflineLearningMode) ...[
                OfflineLearningModeIndicator(
                  onSwitchToOnline: onSwitchToOnline,
                ),
                const SizedBox(height: Grid.two),
              ],
              if (!isOfflineLearningMode) ...[
                const LoadingIndicator(),
              ],
              Expanded(
                child: BlocBuilder<CourseDashboardBloc, CourseDashboardState>(
                  buildWhen: (previous, current) =>
                      previous.courseUiState != current.courseUiState,
                  builder: (context, state) {
                    return state.courseUiState.toView(
                      context,
                      successViewBuilder: (item) {
                        return CourseDashboardContent(
                          course: item,
                          navigationEventHandler: navigationEventHandler,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDashboardBloc, CourseDashboardState>(
      buildWhen: (previous, current) =>
      previous.courseUiState != current.courseUiState,
      builder: (context, state) {
        final isInProgress = state.courseUiState.isInProgress;
        if (isInProgress) {
          return const LinearProgressIndicator(
            minHeight: 2,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}