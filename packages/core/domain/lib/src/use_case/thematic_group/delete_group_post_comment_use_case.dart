import 'package:base/base.dart';

import '../../../domain.dart';

class DeleteGroupPostCommentUseCase {
  final ThematicGroupPostCommentRepository _repository;

  DeleteGroupPostCommentUseCase({
    ThematicGroupPostCommentRepository? repository,
  }) : _repository = repository ?? getIt();

  Future<void> call({
    required String commentId,
  }) {
    return _repository.deleteComment(
      commentId: commentId,
    );
  }
}
