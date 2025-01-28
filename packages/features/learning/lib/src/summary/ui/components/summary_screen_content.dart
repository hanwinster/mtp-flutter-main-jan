import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/summary/models/models.dart';

import '../../../common/common.dart';

class SummaryScreenContent extends StatelessWidget {
  SummaryScreenContent({
    super.key,
    required this.courseId,
    required this.summary,
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
  final UiSummary summary;
  final CourseLearner learner;
  final bool isOfflineMode;
  final CourseNavigator courseNavigator;

  @override
  Widget build(BuildContext context) {
    return LearningAreaContainer(
      navigationButtonBar: CourseNavigationButtonBar(
        courseNavigator: courseNavigator,
      ),
      child: StudyContent(
        courseId: courseId,
        title: summary.title,
        upperInteractiveFeatureGroups: summary.upperInteractiveFeatureGroups,
        media: summary.media,
        resourceUrl: '',
        embedVideoUrl: '',
        attachedFileUrl: '',
        description: summary.description,
        lowerInteractiveFeatureGroups: summary.lowerInteractiveFeatureGroups,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}
