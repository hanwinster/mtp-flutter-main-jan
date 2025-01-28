import 'package:base/base.dart';
import 'package:domain/domain.dart';

class SubmitBlogPostQuizAnswersUseCaseRequest extends Equatable {
  final String postId;

  const SubmitBlogPostQuizAnswersUseCaseRequest({
    required this.postId,
  });

  @override
  List<Object> get props => [postId];
}

class SubmitBlogPostQuizAnswersUseCase {
  SubmitBlogPostQuizAnswersUseCase({
    BlogPostQuizRepository? blogPostQuizRepository,
  }) : _blogPostQuizRepository = blogPostQuizRepository ?? getIt();

  final BlogPostQuizRepository _blogPostQuizRepository;

  Future<BlogPostQuizUserAnswerResult> call(
      SubmitBlogPostQuizAnswersUseCaseRequest request) {
    return _blogPostQuizRepository.submitAnswers(
      postId: request.postId,
    );
  }
}
