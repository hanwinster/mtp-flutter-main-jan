import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/learning_activity/models/models.dart';

import '../../../common/common.dart';

class LearningActivityContent extends StatelessWidget {
  LearningActivityContent({
    super.key,
    required this.courseId,
    required this.activity,
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
  final UiLearningActivity activity;
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
        title: activity.title,
        upperInteractiveFeatureGroups: activity.upperInteractiveFeatureGroups,
        media: activity.media,
        resourceUrl: '',
        embedVideoUrl: '',
        attachedFileUrl: '',
        description: activity.description,
        lowerInteractiveFeatureGroups: activity.lowerInteractiveFeatureGroups,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}
