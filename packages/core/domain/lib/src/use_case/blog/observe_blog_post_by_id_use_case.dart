import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveBlogPostByIdRequest extends Equatable {
  final String postId;

  const ObserveBlogPostByIdRequest({
    required this.postId,
  });

  @override
  List<Object> get props => [postId];
}

class ObserveBlogPostByIdUseCase {
  ObserveBlogPostByIdUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Stream<Result<BlogPost>> call(ObserveBlogPostByIdRequest request) {
    return _blogPostRepository.observeBlogPostById(postId: request.postId);
  }
}
