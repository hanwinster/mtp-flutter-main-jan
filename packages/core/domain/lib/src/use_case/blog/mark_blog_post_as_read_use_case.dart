import 'package:base/base.dart';
import 'package:domain/domain.dart';

class MarkBlogPostAsReadUseCaseRequest extends Equatable {
  final String postId;

  const MarkBlogPostAsReadUseCaseRequest({
    required this.postId,
  });

  @override
  List<Object> get props => [postId];
}

class MarkBlogPostAsReadUseCase {
  MarkBlogPostAsReadUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Future<void> call(
      MarkBlogPostAsReadUseCaseRequest request) {
    return _blogPostRepository.markAsRead(
      postId: request.postId,
    );
  }
}
