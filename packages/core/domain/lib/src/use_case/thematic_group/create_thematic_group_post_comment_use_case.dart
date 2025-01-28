import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CreateThematicGroupPostCommentUseCase {
  CreateThematicGroupPostCommentUseCase({
    ThematicGroupPostCommentRepository? repository,
  }) : _repository = repository ?? getIt();

  final ThematicGroupPostCommentRepository _repository;

  Future<ThematicGroupPostComment> call({
    required String postId,
    required String text,
    Uri? image,
    Uri? video,
  }) {
    return _repository.createComment(
      postId: postId,
      text: text,
      image: image,
      video: video,
    );
  }
}
