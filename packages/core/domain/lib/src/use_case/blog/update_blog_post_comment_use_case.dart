import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateBlogPostCommentRequest extends Equatable {
  final String commentId;
  final String postId;
  final String text;
  final Uri? image;
  final Uri? video;

  const UpdateBlogPostCommentRequest({
    required this.commentId,
    required this.postId,
    required this.text,
    required this.image,
    required this.video,
  });

  @override
  List<Object?> get props => [
        commentId,
        postId,
        text,
        image,
        video,
      ];
}

abstract class UpdateBlogPostCommentResult extends Equatable {
  const UpdateBlogPostCommentResult(
    this.isSuccessful,
    this.message,
  );

  final bool isSuccessful;
  final String message;

  @override
  List<Object?> get props => [
        isSuccessful,
        message,
      ];
}

final class UpdateBlogPostCommentResultSuccess
    extends UpdateBlogPostCommentResult {
  const UpdateBlogPostCommentResultSuccess({
    required String message,
  }) : super(true, message);

  @override
  List<Object> get props => [
        super.props,
      ];
}

final class UpdateBlogPostCommentResultValidationError
    extends UpdateBlogPostCommentResult {
  const UpdateBlogPostCommentResultValidationError({
    required String message,
    required this.textError,
    required this.imageError,
    required this.videoError,
  }) : super(false, message);

  final String? textError;
  final String? imageError;
  final String? videoError;

  @override
  List<Object?> get props => [
        super.props,
        textError,
        imageError,
        videoError,
      ];
}

class UpdateBlogPostCommentUseCase {
  UpdateBlogPostCommentUseCase({
    BlogPostCommentRepository? blogPostCommentRepository,
  }) : _blogPostCommentRepository = blogPostCommentRepository ?? getIt();

  final BlogPostCommentRepository _blogPostCommentRepository;

  Future<UpdateBlogPostCommentResult> call(
      UpdateBlogPostCommentRequest request) {
    return _blogPostCommentRepository.updateComment(
      commentId: request.commentId,
      postId: request.postId,
      text: request.text,
      image: request.image,
      video: request.video,
    );
  }
}
