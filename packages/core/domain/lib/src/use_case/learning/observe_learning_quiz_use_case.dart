import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveLearningQuizUseCaseRequest extends Equatable {
  const ObserveLearningQuizUseCaseRequest({
    required this.courseId,
    required this.quizId,
  });

  final String courseId;
  final String quizId;

  @override
  List<Object?> get props => [courseId, quizId];
}

class ObserveLearningQuizUseCase {
  ObserveLearningQuizUseCase({
    LearningQuizRepository? learningQuizRepository,
  }) : _learningQuizRepository = learningQuizRepository ?? getIt();

  final LearningQuizRepository _learningQuizRepository;

  Stream<Result<LearningQuiz>> call(ObserveLearningQuizUseCaseRequest request) {
    return _learningQuizRepository.observeLearningQuiz(
      courseId: request.courseId,
      quizId: request.quizId,
    );
  }
}
