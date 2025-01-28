import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DeleteBlogPostReactionRequest extends Equatable {
  final String postId;

  final String reactionId;

  const DeleteBlogPostReactionRequest({
    required this.postId,
    required this.reactionId,
  });

  @override
  List<Object> get props => [postId, reactionId];
}

class DeleteBlogPostReactionUseCase {
  DeleteBlogPostReactionUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Future<void> call(DeleteBlogPostReactionRequest request) {
    return _blogPostRepository.deleteReaction(
      postId: request.postId,
      reactionId: request.reactionId,
    );
  }
}
