import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../common/bloc/course_learner/bloc.dart';
import '../../common/common.dart';
import '../bloc/lecture_bloc.dart';
import 'components/components.dart';

class LectureScreen extends StatelessWidget {
  const LectureScreen({
    super.key,
    required this.courseId,
    required this.isOfflineMode,
    required this.navigationEventHandler,
    required this.onSwitchToOnline,
  });

  final String courseId;
  final CourseNavigationEventHandler navigationEventHandler;
  final bool isOfflineMode;
  final SwitchToOnlineEventHandler onSwitchToOnline;

  @override
  Widget build(BuildContext context) {
    return LearningScreenScaffold(
      isOfflineMode: isOfflineMode,
      onSwitchToOnline: onSwitchToOnline,
      navigationEventHandler: navigationEventHandler,
      slivers: [
        BlocListener<CourseLearnerBloc, CourseLearnerState>(
          listenWhen: (previous, current) =>
              previous.learnerUiState != current.learnerUiState,
          listener: (context, state) {
            context
                .read<LectureBloc>()
                .add(LectureLearnerChanged(state.learnerUiState));
          },
          child: BlocBuilder<LectureBloc, LectureState>(
            buildWhen: (previous, current) =>
                previous.lectureUiState != current.lectureUiState ||
                previous.courseLearnerUiState != current.courseLearnerUiState,
            builder: (context, state) {
              return state.lectureUiState.toSliverView(
                context,
                successViewBuilder: (lecture) {
                  final learner = state.courseLearnerUiState.dataOrNull;
                  if (learner == null) {
                    return const SliverToBoxAdapter(
                      child: MtpLoading(),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: LectureScreenContent(
                      courseId: courseId,
                      learner: learner,
                      lecture: lecture,
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
