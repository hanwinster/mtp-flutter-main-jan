import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SaveBlogPostQuizAnswersUseCaseRequest extends Equatable {
  final String postId;
  final BlogPostQuizQuestion question;
  final Map<int, String> answersByIndex;

  const SaveBlogPostQuizAnswersUseCaseRequest({
    required this.postId,
    required this.question,
    required this.answersByIndex,
  });

  @override
  List<Object> get props => [postId, answersByIndex];
}

class SaveBlogPostQuizAnswersUseCase {
  SaveBlogPostQuizAnswersUseCase({
    BlogPostQuizRepository? blogPostQuizRepository,
  }) : _blogPostQuizRepository = blogPostQuizRepository ?? getIt();

  final BlogPostQuizRepository _blogPostQuizRepository;

  Future<void> call(
      SaveBlogPostQuizAnswersUseCaseRequest request) {
    return _blogPostQuizRepository.saveAnswers(
      postId: request.postId,
      question: request.question,
      answersByIndex: request.answersByIndex,
    );
  }
}
