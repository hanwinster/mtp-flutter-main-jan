import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateBlogPostCommentReactionRequest extends Equatable {
  final String commentId;
  final String reactionId;
  final ReactionType reactionType;

  const UpdateBlogPostCommentReactionRequest({
    required this.commentId,
    required this.reactionId,
    required this.reactionType,
  });

  @override
  List<Object> get props => [
        commentId,
        reactionId,
        reactionType,
      ];
}

class UpdateBlogPostCommentReactionUseCase {
  UpdateBlogPostCommentReactionUseCase({
    BlogPostCommentRepository? blogPostCommentRepository,
  }) : _blogPostCommentRepository = blogPostCommentRepository ?? getIt();

  final BlogPostCommentRepository _blogPostCommentRepository;

  Future<void> call(UpdateBlogPostCommentReactionRequest request) {
    return _blogPostCommentRepository.updateReaction(
      commentId: request.commentId,
      reactionId: request.reactionId,
      reactionType: request.reactionType,
    );
  }
}
