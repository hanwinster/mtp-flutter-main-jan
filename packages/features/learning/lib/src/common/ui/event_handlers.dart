import 'package:domain/domain.dart';

typedef NextEventHandler = void Function();
typedef PreviousEventHandler = void Function();
typedef ContinueEventHandler = void Function();
typedef CompleteEventHandler = void Function();
typedef SwitchToOnlineEventHandler = void Function();

abstract class CourseNavigationEventHandler {
  void onCloseEvent();

  void onXApiCourseEvent({
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onIntroductionEvent({
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onLectureEvent({
    required String lectureId,
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onQuizEvent({
    required String quizId,
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onLiveSessionEvent({
    required String liveSessionId,
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onSummaryEvent({
    required String summaryId,
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onLearningActivityEvent({
    required String activityId,
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onAssessmentEvent({
    required String assessmentId,
    required String materialKey,
    required CourseNavigationDirection direction,
  });

  void onEvaluationEvent();
}
