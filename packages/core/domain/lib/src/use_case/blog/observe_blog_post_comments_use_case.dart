import 'package:base/base.dart';
import 'package:domain/domain.dart';

class ObserveBlogPostCommentsRequest extends Equatable {
  final String postId;

  const ObserveBlogPostCommentsRequest({
    required this.postId,
  });

  @override
  List<Object> get props => [postId];
}

class ObserveBlogPostCommentsUseCase {
  ObserveBlogPostCommentsUseCase({
    BlogPostCommentRepository? blogPostCommentRepository,
  }) : _blogPostCommentRepository = blogPostCommentRepository ?? getIt();

  final BlogPostCommentRepository _blogPostCommentRepository;

  Stream<Result<List<BlogPostComment>>> call(
      ObserveBlogPostCommentsRequest request) {
    return _blogPostCommentRepository.observeComments(
      postId: request.postId,
    );
  }
}
