import 'package:base/base.dart';
import 'package:domain/domain.dart';

abstract class ThematicGroupPostCommentRepository {
  Stream<Result<List<ThematicGroupPostComment>>> observeComments({
    required String postId,
  });

  Future<ThematicGroupPostComment> createComment({
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  });

  Future<ThematicGroupPostComment> updateComment({
    required String commentId,
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  });

  Future<ThematicGroupPostCommentReply> createReply({
    required String commentId,
    required String text,
    required Uri? image,
    required Uri? video,
  });

  Future<ThematicGroupPostCommentReply> updateReply({
    required String replyId,
    required String commentId,
    required String text,
    required Uri? image,
    required Uri? video,
  });

  Future<void> deleteComment({
    required String commentId,
  });

  Future<void> deleteReply({
    required String replyId,
  });

}
