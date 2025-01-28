import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseAssessmentUseCaseRequest extends Equatable {
  const ObserveCourseAssessmentUseCaseRequest({
    required this.courseId,
    required this.assessmentId,
  });

  final String courseId;
  final String assessmentId;

  @override
  List<Object?> get props => [courseId, assessmentId];
}

class ObserveCourseAssessmentUseCase {
  ObserveCourseAssessmentUseCase({
    CourseAssessmentRepository? assessmentRepository,
  }) : _assessmentRepository = assessmentRepository ?? getIt();

  final CourseAssessmentRepository _assessmentRepository;

  Stream<Result<AssessmentQuestion>> call(
      ObserveCourseAssessmentUseCaseRequest request) {
    return _assessmentRepository.observeAssessmentQuestion(
      courseId: request.courseId,
      questionId: request.assessmentId,
    );
  }
}
