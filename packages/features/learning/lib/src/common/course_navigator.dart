import 'package:domain/domain.dart';
import 'package:learning/learning.dart';

class CourseNavigator {
  const CourseNavigator({
    required this.materialKey,
    required this.learner,
    required this.navigationEventHandler,
  });

  final String materialKey;
  final CourseLearner learner;
  final CourseNavigationEventHandler navigationEventHandler;

  CourseMaterialType getCurrentMaterialType() {
    return learner.findMaterial(materialKey).type;
  }

  bool hasPreviousMaterial() {
    return learner.hasPreviousMaterial(materialKey);
  }

  bool hasNextMaterial() {
    return learner.hasNextMaterial(materialKey);
  }

  bool hasCompletedAllMaterials() {
    return learner.hasCompletedAllMaterials;
  }

  CourseMaterial getCurrentMaterial() {
    return learner.findMaterial(materialKey).toCourseMaterial();
  }

  CourseMaterial? getPreviousMaterial() {
    return learner
        .getPreviousMaterial(currentMaterialKey: materialKey)
        ?.toCourseMaterial();
  }

  CourseMaterial? getNextMaterial() {
    return learner
        .getNextMaterial(currentMaterialKey: materialKey)
        ?.toCourseMaterial();
  }

  void navigateToXApiCourse({
    required CourseNavigationDirection direction,
  }) {
    final xApiMaterial = learner.xApiMaterial;
    if (xApiMaterial == null) {
      return;
    }
    navigationEventHandler.onXApiCourseEvent(
      materialKey: xApiMaterial.key,
      direction: direction,
    );
  }

  void navigateToMaterial({
    required CourseMaterial material,
    required CourseNavigationDirection direction,
  }) {
    switch (material.type) {
      case CourseMaterialType.xapi:
        navigationEventHandler.onXApiCourseEvent(
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.intro:
        navigationEventHandler.onIntroductionEvent(
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.lecture:
        navigationEventHandler.onLectureEvent(
          lectureId: material.id,
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.learningActivity:
        navigationEventHandler.onLearningActivityEvent(
          activityId: material.id,
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.quiz:
        navigationEventHandler.onQuizEvent(
          quizId: material.id,
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.summary:
        navigationEventHandler.onSummaryEvent(
          summaryId: material.id,
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.assessment:
        navigationEventHandler.onAssessmentEvent(
          assessmentId: material.id,
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.liveSession:
        navigationEventHandler.onLiveSessionEvent(
          liveSessionId: material.id,
          materialKey: material.key,
          direction: direction,
        );
      case CourseMaterialType.evaluation:
        navigationEventHandler.onEvaluationEvent();
      case CourseMaterialType.unknown:
        // no-op
        break;
    }
  }
}
