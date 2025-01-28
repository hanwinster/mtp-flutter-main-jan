import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class CourseAssessmentRepository {

  Stream<Result<AssessmentQuestion>> observeAssessmentQuestion({
    required String courseId,
    required String questionId,
  });

  Stream<Result<List<AssessmentQuestion>>> observeAssessmentQuestions({
    required String courseId,
  });

  Future<void> saveAssessmentAnswer({
    required String courseId,
    required String questionId,
    required AssessmentAnswer answer,
  });

  Future<AssessmentSubmissionResult> submitAssessment({
    required String courseId,
  });
}
