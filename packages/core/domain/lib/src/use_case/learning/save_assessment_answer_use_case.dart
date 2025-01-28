import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SaveAssessmentAnswerUseCaseRequest extends Equatable {
  final String courseId;
  final String questionId;
  final AssessmentAnswer answer;

  const SaveAssessmentAnswerUseCaseRequest({
    required this.courseId,
    required this.questionId,
    required this.answer,
  });

  @override
  List<Object> get props => [questionId, answer];
}

class SaveAssessmentAnswerUseCase {
  SaveAssessmentAnswerUseCase({
    CourseAssessmentRepository? assessmentRepository,
  }) : _assessmentRepository = assessmentRepository ?? getIt();
  final CourseAssessmentRepository _assessmentRepository;

  Future<void> call(SaveAssessmentAnswerUseCaseRequest request) async {
    await _assessmentRepository.saveAssessmentAnswer(
      courseId: request.courseId,
      questionId: request.questionId,
      answer: request.answer,
    );
  }
}