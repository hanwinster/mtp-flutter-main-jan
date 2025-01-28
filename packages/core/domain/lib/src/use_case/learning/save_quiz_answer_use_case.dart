import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SaveQuizAnswerUseCaseRequest extends Equatable {
  final String courseId;
  final String quizId;
  final LearningQuizType quizType;
  final Map<String, QuizAnswer> answersById;

  const SaveQuizAnswerUseCaseRequest({
    required this.courseId,
    required this.quizId,
    required this.quizType,
    required this.answersById,
  });

  @override
  List<Object> get props => [
        courseId,
        quizId,
        answersById,
        quizType,
      ];
}

class SaveQuizAnswerUseCase {
  SaveQuizAnswerUseCase({
    LearningQuizRepository? quizRepository,
  }) : _quizRepository = quizRepository ?? getIt();
  final LearningQuizRepository _quizRepository;

  Future<void> call(SaveQuizAnswerUseCaseRequest request) async {
    await _quizRepository.saveQuizAnswer(
      courseId: request.courseId,
      quizId: request.quizId,
      quizType: request.quizType,
      answersById: request.answersById,
    );
  }
}
