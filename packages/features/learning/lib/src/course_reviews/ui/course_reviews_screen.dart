import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/learning.dart';
import 'package:ui/ui.dart';

import '../bloc/course_reviews_bloc.dart';
import '../review_form/review_form.dart';
import 'course_reviews_content.dart';

class CourseReviewsScreen extends StatelessWidget {
  const CourseReviewsScreen({
    super.key,
    required this.courseId,
    required this.hasEnrolled,
    required this.isLoggedIn,
    required this.onLoginEvent,
  });

  final String courseId;
  final bool hasEnrolled;
  final bool isLoggedIn;
  final LoginEventEventHandler onLoginEvent;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              BlocBuilder<CourseReviewsBloc, CourseReviewsState>(
                buildWhen: (previous, current) =>
                    previous.reviewsUiState != current.reviewsUiState,
                builder: (context, state) {
                  return state.reviewsUiState.toView(
                    context,
                    successViewBuilder: (items) {
                      return CourseReviewsContent(
                        items: items,
                      );
                    },
                  );
                },
              ),
              if (isLoggedIn && hasEnrolled)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Grid.two,
                        vertical: Grid.two,
                      ),
                      child: MtpPrimaryButton(
                        onPressed: () async {
                          await _showReviewForm(context);
                        },
                        labelText: context.l10n.courseReviewLabelWriteAReview,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showReviewForm(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: ReviewFormScreenEntry(
            courseId: courseId,
          ),
        );
      },
    );
    if (result == true) {
      if (!context.mounted) return;
      context.read<CourseReviewsBloc>().add(
            const CourseReviewsFetched(),
          );
    }
  }
}
