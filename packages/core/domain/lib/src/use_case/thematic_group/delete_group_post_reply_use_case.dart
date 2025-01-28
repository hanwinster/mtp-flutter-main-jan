import 'package:base/base.dart';

import '../../../domain.dart';

class DeleteGroupPostReplyUseCase {
  final ThematicGroupPostCommentRepository _repository;

  DeleteGroupPostReplyUseCase({
    ThematicGroupPostCommentRepository? repository,
  }) : _repository = repository ?? getIt();

  Future<void> call({
    required String replyId,
  }) {
    return _repository.deleteReply(
      replyId: replyId,
    );
  }
}
