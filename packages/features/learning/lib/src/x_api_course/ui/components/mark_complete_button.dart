import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../../common/bloc/course_navigation/bloc.dart';
import '../../bloc/bloc.dart';

class MarkCompleteButton extends StatelessWidget {
  const MarkCompleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseNavigationBloc, CourseNavigationState>(
      buildWhen: (previous, current) =>
          previous.navigationState != current.navigationState,
      builder: (context, state) {
        final isNavigationInProgress = state.navigationState.isInProgress;
        return BlocBuilder<XApiCourseBloc, XApiCourseState>(
          buildWhen: (previous, current) =>
              previous.completedUiState != current.completedUiState,
          builder: (context, state) {
            final isInProgress = state.completedUiState is UiStateInProgress ||
                isNavigationInProgress;
            return MtpTextButton(
              onPressed: isInProgress
                  ? null
                  : () {
                      context
                          .read<XApiCourseBloc>()
                          .add(const XApiCourseCompleted());
                    },
              label: isInProgress ? const MtpLoading() : null,
              labelText: isInProgress
                  ? null
                  : context.l10n.courseXApiButtonTextMarkComplete,
            );
          },
        );
      },
    );
  }
}
