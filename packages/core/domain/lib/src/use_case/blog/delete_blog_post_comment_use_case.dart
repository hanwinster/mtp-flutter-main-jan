import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DeleteBlogPostCommentRequest extends Equatable {
  final String postId;
  final String commentId;

  const DeleteBlogPostCommentRequest({
    required this.postId,
    required this.commentId,
  });

  @override
  List<Object> get props => [postId, commentId];
}

class DeleteBlogPostCommentUseCase {
  DeleteBlogPostCommentUseCase({
    BlogPostCommentRepository? blogPostCommentRepository,
  }) : _blogPostCommentRepository = blogPostCommentRepository ?? getIt();

  final BlogPostCommentRepository _blogPostCommentRepository;

  Future<void> call(DeleteBlogPostCommentRequest request) {
    return _blogPostCommentRepository.deleteComment(
      commentId: request.commentId,
      postId: request.postId,
    );
  }
}
