import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SaveEvaluationAnswersUseCaseRequest extends Equatable {
  const SaveEvaluationAnswersUseCaseRequest({
    required this.courseId,
    required this.answers,
});

  final String courseId;
  final List<String> answers;

  @override
  List<Object?> get props => [courseId, answers];
}

class SaveEvaluationAnswersUseCase {
  SaveEvaluationAnswersUseCase({
    EvaluationRepository? evaluationRepository,
  }) : _evaluationRepository =
      evaluationRepository ?? getIt();

  final EvaluationRepository _evaluationRepository;

  Future<String> call(SaveEvaluationAnswersUseCaseRequest request) {
    return _evaluationRepository.saveEvaluationAnswers(
      courseId: request.courseId,
      answers: request.answers,
    );
  }
}