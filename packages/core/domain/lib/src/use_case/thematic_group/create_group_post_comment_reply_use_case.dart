import 'package:base/base.dart';
import 'package:domain/domain.dart';

class CreateGroupPostCommentReplyUseCase {
  final ThematicGroupPostCommentRepository _repository;

  CreateGroupPostCommentReplyUseCase({
    ThematicGroupPostCommentRepository? repository,
  }) : _repository = repository ?? getIt();

  Future<ThematicGroupPostCommentReply> call({
    required String commentId,
    required String postId,
    required String text,
    Uri? image,
    Uri? video,
  }) {
    return _repository.createReply(
      commentId: commentId,
      text: text,
      image: image,
      video: video,
    );
  }
}
