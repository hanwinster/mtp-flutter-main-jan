import 'package:base/base.dart';
import 'package:domain/domain.dart';

class GetBlogPostQuizQuestionsUseCaseRequest extends Equatable {
  final String postId;

  const GetBlogPostQuizQuestionsUseCaseRequest({
    required this.postId,
  });

  @override
  List<Object> get props => [postId];
}

class GetBlogPostQuizQuestionsUseCase {
  GetBlogPostQuizQuestionsUseCase({
    BlogPostQuizRepository? blogPostQuizRepository,
  }) : _blogPostQuizRepository = blogPostQuizRepository ?? getIt();

  final BlogPostQuizRepository _blogPostQuizRepository;

  Future<List<BlogPostQuizQuestion>> call(GetBlogPostQuizQuestionsUseCaseRequest request) {
    return _blogPostQuizRepository.getQuestions(
      postId: request.postId,
    );
  }
}
