import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/course_discussions/ui/components/message_input.dart';
import 'package:ui/ui.dart';

import '../../bloc/bloc.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Grid.one),
        border: Border.all(
          color: context.colorScheme.outline.withOpacity(0.36),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _FormSubmissionIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Grid.one,
            ),
            child: Row(
              children: [
                const SizedBox(width: Grid.two),
                const Expanded(
                  child: MessageInput(),
                ),
                const SizedBox(width: Grid.one),
                BlocBuilder<CourseDiscussionsBloc, CourseDiscussionsState>(
                  buildWhen: (previous, current) =>
                      previous.messageSubmissionState !=
                      current.messageSubmissionState,
                  builder: (context, state) {
                    final isInProgress =
                        state.messageSubmissionState is UiStateInProgress;
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: isInProgress
                            ? null
                            : () {
                                hideKeyboard();
                                context.read<CourseDiscussionsBloc>().add(
                                      const CourseDiscussionMessageSubmitted(),
                                    );
                              },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(Grid.two),
                          ),
                          child: Icon(
                            Icons.send,
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: Grid.one),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FormSubmissionIndicator extends StatelessWidget {
  const _FormSubmissionIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDiscussionsBloc, CourseDiscussionsState>(
      buildWhen: (previous, current) =>
          previous.messageSubmissionState != current.messageSubmissionState,
      builder: (context, state) {
        final isInProgress = state.messageSubmissionState.isInProgress;
        if (!isInProgress) {
          return const SizedBox.shrink();
        }

        return const LinearProgressIndicator(
          minHeight: 1,
        );
      },
    );
  }
}
