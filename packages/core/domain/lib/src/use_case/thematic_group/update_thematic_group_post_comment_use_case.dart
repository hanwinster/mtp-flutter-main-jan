import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateThematicGroupPostCommentUseCase {
  UpdateThematicGroupPostCommentUseCase({
    ThematicGroupPostCommentRepository? repository,
  }) : _repository = repository ?? getIt();

  final ThematicGroupPostCommentRepository _repository;

  Future<ThematicGroupPostComment> call({
    required String commentId,
    required String postId,
    required String text,
    Uri? image,
    Uri? video,
  }) {
    return _repository.updateComment(
      commentId: commentId,
      postId: postId,
      text: text,
      image: image,
      video: video,
    );
  }
}
