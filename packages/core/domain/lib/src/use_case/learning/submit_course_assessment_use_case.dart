import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SubmitCourseAssessmentUseCaseRequest extends Equatable {
  final String courseId;

  const SubmitCourseAssessmentUseCaseRequest({
    required this.courseId,
  });

  @override
  List<Object> get props => [courseId];
}

class SubmitCourseAssessmentUseCase {
  SubmitCourseAssessmentUseCase({
    CourseAssessmentRepository? assessmentRepository,
  }) : _assessmentRepository = assessmentRepository ?? getIt();
  final CourseAssessmentRepository _assessmentRepository;

  Future<AssessmentSubmissionResult> call(SubmitCourseAssessmentUseCaseRequest request) async {
    return _assessmentRepository.submitAssessment(
      courseId: request.courseId,
    );
  }
}