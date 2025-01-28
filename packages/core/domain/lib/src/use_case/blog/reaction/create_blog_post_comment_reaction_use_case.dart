import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CreateBlogPostCommentReactionRequest extends Equatable {
  final String commentId;
  final ReactionType reaction;

  const CreateBlogPostCommentReactionRequest({
    required this.commentId,
    required this.reaction,
  });

  @override
  List<Object> get props => [
        commentId,
        reaction,
      ];
}

class CreateBlogPostCommentReactionUseCase {
  CreateBlogPostCommentReactionUseCase({
    BlogPostCommentRepository? blogPostCommentRepository,
  }) : _blogPostCommentRepository = blogPostCommentRepository ?? getIt();

  final BlogPostCommentRepository _blogPostCommentRepository;

  Future<void> call(CreateBlogPostCommentReactionRequest request) {
    return _blogPostCommentRepository.createReaction(
      commentId: request.commentId,
      reactionType: request.reaction,
    );
  }
}
