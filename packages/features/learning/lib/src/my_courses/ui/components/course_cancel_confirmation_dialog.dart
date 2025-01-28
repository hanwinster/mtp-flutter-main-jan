import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class CourseCancelConfirmationDialog extends StatelessWidget {
  const CourseCancelConfirmationDialog({super.key, required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyCoursesBloc, MyCoursesState>(
      listenWhen: (previous, current) =>
          previous.courseCancellationUiState !=
          current.courseCancellationUiState,
      listener: (context, state) {
        if (state.courseCancellationUiState is UiStateSuccess) {
          Navigator.of(context).pop();
          context.read<MyCoursesBloc>().add(
                const MyCoursesOngoingCoursesRefreshed(),
              );
        }
      },
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MtpAssets.images.icCancelDialog.image(
              width: 200,
              height: 200,
            ),
            Text(
              context.l10n.courseLabelCancelCourseConfirmationTitle,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: Grid.one),
            Text(
              context.l10n.courseLabelCancelCourseConfirmationMessage,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: Grid.two,
          vertical: Grid.two,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.courseButtonTextCancelCourseDismiss),
          ),
          BlocBuilder<MyCoursesBloc, MyCoursesState>(
            buildWhen: (previous, current) =>
                previous.courseCancellationUiState !=
                current.courseCancellationUiState,
            builder: (context, state) {
              final isInProgress =
                  state.courseCancellationUiState is UiStateInProgress;
              return ElevatedButton(
                onPressed: isInProgress
                    ? null
                    : () {
                        context.read<MyCoursesBloc>().add(
                              MyCoursesCancelCourseRequested(courseId),
                            );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.error,
                ),
                child: Text(context.l10n.courseButtonTextCancelCourseConfirm),
              );
            },
          ),
        ],
      ),
    );
  }
}
