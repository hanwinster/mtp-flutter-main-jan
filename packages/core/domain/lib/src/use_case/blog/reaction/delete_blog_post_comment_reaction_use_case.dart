import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DeleteBlogPostCommentReactionRequest extends Equatable {
  final String commentId;
  final String reactionId;

  const DeleteBlogPostCommentReactionRequest({
    required this.commentId,
    required this.reactionId,
  });

  @override
  List<Object> get props => [commentId, reactionId];
}

class DeleteBlogPostCommentReactionUseCase {
  DeleteBlogPostCommentReactionUseCase({
    BlogPostCommentRepository? blogPostCommentRepository,
  }) : _blogPostCommentRepository = blogPostCommentRepository ?? getIt();

  final BlogPostCommentRepository _blogPostCommentRepository;

  Future<void> call(DeleteBlogPostCommentReactionRequest request) {
    return _blogPostCommentRepository.deleteReaction(
      commentId: request.commentId,
      reactionId: request.reactionId,
    );
  }
}
