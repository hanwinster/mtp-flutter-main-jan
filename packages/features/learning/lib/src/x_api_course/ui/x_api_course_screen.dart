import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/common/bloc/course_learner/bloc.dart';
import 'package:learning/src/common/bloc/course_navigation/bloc.dart';
import 'package:learning/src/common/common.dart';
import 'package:ui/ui.dart';

import '../../common/ui/components/learning_app_bar_back_button.dart';
import '../bloc/x_api_course_bloc.dart';
import 'components/components.dart';

class XApiCourseScreen extends StatelessWidget {
  const XApiCourseScreen({
    super.key,
    required this.courseNavigationEventHandler,
  });

  final CourseNavigationEventHandler courseNavigationEventHandler;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CourseLearnerBloc, CourseLearnerState>(
          listenWhen: (previous, current) =>
              previous.learnerUiState != current.learnerUiState,
          listener: (context, state) {
            context
                .read<XApiCourseBloc>()
                .add(XApiCourseLearnerChanged(state.learnerUiState));
          },
        ),
        BlocListener<XApiCourseBloc, XApiCourseState>(
          listenWhen: (previous, current) =>
              previous.completedUiState != current.completedUiState,
          listener: (context, state) {
            if (state.completedUiState is UiStateSuccess) {
              final result = state.completedUiState.dataOrThrow;
              if (result.completionStatus == XApiCompletionStatus.completed) {
                context.read<CourseNavigationBloc>().add(
                    const CourseNavigationDirectionChanged(
                        CourseNavigationDirection.next));
              } else if (result.completionStatus ==
                  XApiCompletionStatus.incomplete) {
                showSnackBar(
                    context, context.l10n.courseXApiLabelRequiredToComplete);
              }
            } else if (state.completedUiState is UiStateFailure) {
              showSnackBar(
                  context, state.completedUiState.messageOrEmpty(context));
            }
          },
        ),
        BlocListener<CourseNavigationBloc, CourseNavigationState>(
          listenWhen: (previous, current) =>
              previous.navigationState != current.navigationState,
          listener: (context, state) {
            if (state.navigationState is UiStateSuccess) {
              final result = state.navigationState.dataOrNull;
              final learner = context
                  .read<XApiCourseBloc>()
                  .state
                  .courseLearnerUiState
                  .dataOrNull;
              if (result != null && learner != null) {
                final courseNavigator = CourseNavigator(
                  materialKey: state.materialKey,
                  learner: learner,
                  navigationEventHandler: courseNavigationEventHandler,
                );
                courseNavigator.navigateToMaterial(
                  material: result.material,
                  direction: result.direction,
                );
              }
            } else if (state.navigationState is UiStateFailure) {
              showSnackBar(
                  context, state.navigationState.messageOrEmpty(context));
            }
          },
        ),
      ],
      child: LearningQuitPopScope(
        navigationEventHandler: courseNavigationEventHandler,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: const LearningAppBarBackButton(),
            actions: const [
              MarkCompleteButton(),
            ],
          ),
          body: Stack(
            children: [
              BlocBuilder<XApiCourseBloc, XApiCourseState>(
                buildWhen: (previous, current) =>
                    previous.courseUiState != current.courseUiState,
                builder: (context, state) {
                  return state.courseUiState.toView(
                    context,
                    successViewBuilder: (data) {
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
              const XApiScreenContent(),
            ],
          ),
        ),
      ),
    );
  }
}
