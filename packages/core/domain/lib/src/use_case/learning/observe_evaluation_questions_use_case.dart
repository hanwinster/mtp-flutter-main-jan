import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveEvaluationQuestionsUseCaseRequest extends Equatable {
  const ObserveEvaluationQuestionsUseCaseRequest({
    required this.courseId,
});

  final String courseId;

  @override
  List<Object?> get props => [courseId];
}

class ObserveEvaluationQuestionsUseCase {
  ObserveEvaluationQuestionsUseCase({
    EvaluationRepository? evaluationRepository,
  }) : _evaluationRepository =
      evaluationRepository ?? getIt();

  final EvaluationRepository _evaluationRepository;

  Stream<Result<List<EvaluationQuestion>>> call(ObserveEvaluationQuestionsUseCaseRequest request) {
    return _evaluationRepository.observeEvaluationQuestions(
      courseId: request.courseId,
    );
  }
}