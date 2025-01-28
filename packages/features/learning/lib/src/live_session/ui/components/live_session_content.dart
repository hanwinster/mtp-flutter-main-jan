import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../common/common.dart';

class LiveSessionContent extends StatelessWidget {
  LiveSessionContent({
    super.key,
    required this.courseId,
    required this.liveSession,
    required this.learner,
    required this.isOfflineMode,
    required String materialKey,
    required CourseNavigationEventHandler navigationEventHandler,
  }) : courseNavigator = CourseNavigator(
          materialKey: materialKey,
          learner: learner,
          navigationEventHandler: navigationEventHandler,
        );

  final String courseId;
  final LiveSession liveSession;
  final CourseLearner learner;
  final bool isOfflineMode;
  final CourseNavigator courseNavigator;

  @override
  Widget build(BuildContext context) {
    return LearningAreaContainer(
      navigationButtonBar: CourseNavigationButtonBar(
        courseNavigator: courseNavigator,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Grid.two),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Grid.two),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHigh,
                border: Border.all(color: context.colorScheme.primary),
                borderRadius: const BorderRadius.all(Radius.circular(Grid.one)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Grid.two),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.l10n.courseLiveSessionLabelAgenda} :',
                          style: context.textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: Grid.two,
                        ),
                        Expanded(
                          child: Text(
                            liveSession.topic,
                            style: context.textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: context.colorScheme.primary,
                    thickness: 1,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Grid.two),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.l10n.courseLiveSessionLabelSessionDuration} :',
                          style: context.textTheme.labelMedium,
                        ),
                        const SizedBox(width: Grid.two),
                        Expanded(
                          child: Text(
                            context.l10n.durationUnitMinute(
                                liveSession.duration.inMinutes),
                            style: context.textTheme.bodyLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: context.colorScheme.primary,
                    thickness: 1,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Grid.two),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.l10n.courseLiveSessionLabelSessionDateTime} :',
                          style: context.textTheme.labelMedium,
                        ),
                        const SizedBox(width: Grid.two),
                        Expanded(
                          child: Text(
                            liveSession.startDateTime
                                .toLocal()
                                .asDateTime(context),
                            style: context.textTheme.bodyLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (liveSession.isStarted) ...[
              const SizedBox(height: Grid.two),
              Text(
                context.l10n.courseLiveSessionLabelRegistrationPeriodOver,
                style: context.textTheme.bodyMedium,
              )
            ]
          ],
        ),
      ),
    );
  }
}
