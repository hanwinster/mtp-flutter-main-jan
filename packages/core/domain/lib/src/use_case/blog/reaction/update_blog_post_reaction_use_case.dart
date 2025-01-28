import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateBlogPostReactionRequest extends Equatable {
  final String postId;
  final String reactionId;
  final ReactionType reactionType;

  const UpdateBlogPostReactionRequest({
    required this.postId,
    required this.reactionId,
    required this.reactionType,
  });

  @override
  List<Object> get props => [
        postId,
        reactionId,
        reactionType,
      ];
}

class UpdateBlogPostReactionUseCase {
  UpdateBlogPostReactionUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Future<void> call(UpdateBlogPostReactionRequest request) {
    return _blogPostRepository.updateReaction(
      postId: request.postId,
      reactionId: request.reactionId,
      reactionType: request.reactionType,
    );
  }
}
