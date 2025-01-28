import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveCourseAssessmentsUseCaseRequest extends Equatable {
  const ObserveCourseAssessmentsUseCaseRequest({
    required this.courseId,
  });

  final String courseId;

  @override
  List<Object?> get props => [courseId];
}

class ObserveCourseAssessmentsUseCase {
  ObserveCourseAssessmentsUseCase({
    CourseAssessmentRepository? assessmentRepository,
  }) : _assessmentRepository = assessmentRepository ?? getIt();

  final CourseAssessmentRepository _assessmentRepository;

  Stream<Result<List<AssessmentQuestion>>> call(
      ObserveCourseAssessmentsUseCaseRequest request) {
    return _assessmentRepository.observeAssessmentQuestions(
      courseId: request.courseId,
    );
  }
}
