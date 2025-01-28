import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/common/common.dart';
import 'package:learning/src/lecture/models/models.dart';

class LectureScreenContent extends StatelessWidget {
  LectureScreenContent({
    super.key,
    required this.courseId,
    required this.lecture,
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
  final UiLecture lecture;
  final CourseLearner learner;
  final CourseNavigator courseNavigator;
  final bool isOfflineMode;

  @override
  Widget build(BuildContext context) {
    return LearningAreaContainer(
      navigationButtonBar: CourseNavigationButtonBar(
        courseNavigator: courseNavigator,
      ),
      child: StudyContent(
        courseId: courseId,
        title: lecture.title,
        upperInteractiveFeatureGroups: lecture.upperInteractiveFeatureGroups,
        resourceUrl: lecture.resourceUrl,
        embedVideoUrl: lecture.resourceType == LectureResourceType.embedVideo
            ? lecture.videoUrl
            : '',
        attachedFileUrl: lecture.resourceType == LectureResourceType.attachFile
            ? lecture.attachedFileUrl
            : '',
        media: lecture.media,
        description: lecture.description,
        lowerInteractiveFeatureGroups: lecture.lowerInteractiveFeatureGroups,
        isOfflineMode: isOfflineMode,
      ),
    );
  }
}
