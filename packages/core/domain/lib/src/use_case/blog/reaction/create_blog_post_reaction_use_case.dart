import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CreateBlogPostReactionRequest extends Equatable {
  final String postId;
  final ReactionType reactionType;

  const CreateBlogPostReactionRequest({
    required this.postId,
    required this.reactionType,
  });

  @override
  List<Object> get props => [postId, reactionType];
}

class CreateBlogPostReactionUseCase {
  CreateBlogPostReactionUseCase({
    BlogPostRepository? blogPostRepository,
  }) : _blogPostRepository = blogPostRepository ?? getIt();

  final BlogPostRepository _blogPostRepository;

  Future<void> call(CreateBlogPostReactionRequest request) {
    return _blogPostRepository.createReaction(
      postId: request.postId,
      reactionType: request.reactionType,
    );
  }
}
