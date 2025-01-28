import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/learning.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ui/ui.dart';

import 'components.dart';

class CourseDetailContent extends StatelessWidget {
  const CourseDetailContent({
    super.key,
    required this.course,
    required this.isOfflineMode,
    required this.isLoggedIn,
    required this.onLaunchCourseEvent,
    required this.onGoToOfflineCoursesEvent,
    required this.onLoginEvent,
  });

  final Course course;
  final bool isLoggedIn;
  final bool isOfflineMode;
  final LaunchCourseEventHandler onLaunchCourseEvent;
  final GoToOfflineCoursesEventHandler onGoToOfflineCoursesEvent;
  final LoginEventEventHandler onLoginEvent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: MtpAssets.images.courseBackground.image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: BackButton(
                  color: context.colorScheme.onPrimary,
                ),
                actions: const [
                  _ShareButton(
                    shareLink: 'https://mmteacherplatform.net',
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: HeaderSection(
                  course: course,
                  isLoggedIn: isLoggedIn,
                  onContinueEvent: () {
                    final learnerId = course.courseLearner?.id ?? '';
                    if (learnerId.isEmpty) {
                      // This should never happen
                      logger.w('Learner ID is empty');
                      return;
                    }
                    onLaunchCourseEvent(
                      courseId: course.id,
                      learnerId: learnerId,
                    );
                  },
                  onGoToOfflineCoursesEvent: onGoToOfflineCoursesEvent,
                ),
              ),
              const SliverSizedBox(height: Grid.four),
            ];
          },
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: SafeArea(
              top: true,
              bottom: false,
              child: Builder(
                builder: (context) {
                  return BodySection(
                    course: course,
                    isOfflineMode: isOfflineMode,
                    isLoggedIn: isLoggedIn,
                    onLoginEvent: onLoginEvent,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton({
    required this.shareLink,
  });

  final String shareLink;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await Share.share(shareLink);
      },
      icon: const Icon(Icons.share),
      color: context.colorScheme.onPrimary,
    );
  }
}
