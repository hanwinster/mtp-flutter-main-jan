import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:learning/src/course_discussions/ui/components/components.dart';
import 'package:ui/ui.dart';

import '../bloc/course_discussions_bloc.dart';
import 'course_discussion_message_list.dart';

class CourseDiscussionsScreen extends StatelessWidget {
  const CourseDiscussionsScreen({
    super.key,
    required this.hasEnrolled,
    required this.isLoggedIn,
    required this.onLoginEvent,
  });

  final bool hasEnrolled;
  final bool isLoggedIn;
  final LoginEventEventHandler onLoginEvent;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseDiscussionsBloc, CourseDiscussionsState>(
      listenWhen: (previous, current) =>
          previous.messageSubmissionState != current.messageSubmissionState,
      listener: (context, state) {
        if (state.messageSubmissionState is UiStateSuccess) {
          context.read<CourseDiscussionsBloc>().add(
                const CourseDiscussionMessageChanged(''),
              );
          context.read<CourseDiscussionsBloc>().add(
                const CourseDiscussionsMessagesFetched(),
              );
        } else if (state.messageSubmissionState is UiStateFailure) {
          showSnackBar(
              context, state.messageSubmissionState.messageOrEmpty(context));
        }
      },
      child: Column(
        children: [
          if (!isLoggedIn)
            InkWell(
              onTap: () => onLoginEvent(),
              child: Padding(
                padding: const EdgeInsets.all(Grid.two),
                child: MtpHtml(
                  context.l10n.courseReviewLabelGuestMessage,
                  textStyle: context.textTheme.bodyMedium,
                ),
              ),
            ),
          if (isLoggedIn && !hasEnrolled)
            Padding(
              padding: const EdgeInsets.all(Grid.two),
              child: Text(
                context.l10n.courseReviewLabelLearnerMessage,
                style: context.textTheme.bodyMedium,
              ),
            ),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<CourseDiscussionsBloc, CourseDiscussionsState>(
                  buildWhen: (previous, current) =>
                      previous.messagesUiState != current.messagesUiState,
                  builder: (context, state) {
                    return state.messagesUiState.toView(
                      context,
                      successViewBuilder: (items) {
                        return CourseDiscussionMessageList(
                          items: items,
                        );
                      },
                    );
                  },
                ),
                if (isLoggedIn && hasEnrolled)
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Grid.two,
                          vertical: Grid.two,
                        ),
                        child: MessageBox(),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
