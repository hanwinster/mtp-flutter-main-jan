import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CreateBlogPostCommentRequest extends Equatable {
  final String postId;
  final String text;
  final Uri? image;
  final Uri? video;

  const CreateBlogPostCommentRequest({
    required this.postId,
    required this.text,
    required this.image,
    required this.video,
  });

  @override
  List<Object?> get props => [
        postId,
        text,
        image,
        video,
      ];
}

abstract class CreateBlogPostCommentResult extends Equatable {
  const CreateBlogPostCommentResult(
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

final class CreateBlogPostCommentResultSuccess
    extends CreateBlogPostCommentResult {
  const CreateBlogPostCommentResultSuccess({
    required String message,
  }) : super(true, message);

  @override
  List<Object> get props => [
        super.props,
      ];
}

final class CreateBlogPostCommentResultValidationError
    extends CreateBlogPostCommentResult {
  const CreateBlogPostCommentResultValidationError({
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

class CreateBlogPostCommentUseCase {
  CreateBlogPostCommentUseCase({
    BlogPostCommentRepository? blogPostCommentRepository,
  }) : _blogPostCommentRepository = blogPostCommentRepository ?? getIt();

  final BlogPostCommentRepository _blogPostCommentRepository;

  Future<CreateBlogPostCommentResult> call(
      CreateBlogPostCommentRequest request) {
    return _blogPostCommentRepository.createComment(
      postId: request.postId,
      text: request.text,
      image: request.image,
      video: request.video,
    );
  }
}
