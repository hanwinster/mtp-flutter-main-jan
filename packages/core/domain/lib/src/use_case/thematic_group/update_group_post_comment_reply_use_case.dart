import 'package:base/base.dart';
import 'package:domain/domain.dart';

class UpdateGroupPostCommentReplyUseCase {
  final ThematicGroupPostCommentRepository _repository;

  UpdateGroupPostCommentReplyUseCase({
    ThematicGroupPostCommentRepository? repository,
  }) : _repository = repository ?? getIt();

  Future<ThematicGroupPostCommentReply> call({
    required String replyId,
    required String commentId,
    required String postId,
    required String text,
    Uri? image,
    Uri? video,
  }) {
    return _repository.updateReply(
      replyId: replyId,
      commentId: commentId,
      text: text,
      image: image,
      video: video,
    );
  }
}
