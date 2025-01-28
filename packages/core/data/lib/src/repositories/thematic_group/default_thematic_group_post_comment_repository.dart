import 'dart:io';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:domain/domain.dart';

class DefaultThematicGroupPostCommentRepository
    extends ThematicGroupPostCommentRepository {
  DefaultThematicGroupPostCommentRepository({
    MtpApi? api,
  }) : _api = api ?? getIt();

  final MtpApi _api;

  @override
  Future<ThematicGroupPostComment> createComment({
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.createThematicGroupPostComment(
        postId: postId.toIntOrThrow(),
        description: text,
        uploadedFile: image != null ? File.fromUri(image) : null,
        uploadedVideo: video != null ? File.fromUri(video) : null,
      ),
    );
    return result.toDomainModel();
  }

  @override
  Future<ThematicGroupPostComment> updateComment({
    required String commentId,
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.updateThematicGroupPostComment(
        commentId: commentId.toIntOrThrow(),
        postId: postId.toIntOrThrow(),
        description: text,
        uploadedFile: image != null ? File.fromUri(image) : null,
        uploadedVideo: video != null ? File.fromUri(video) : null,
      ),
    );
    return result.toDomainModel();
  }

  @override
  Stream<Result<List<ThematicGroupPostComment>>> observeComments({
    required String postId,
  }) async* {
    final result = await remoteDataSourceCall(
      () => _api.getThematicGroupPostComments(
        post_id: postId,
        page: 1,
        pasgeSize: 9999, // Note: Temporary solution to meet deadline
      ),
    );
    yield ResultSuccess(result.map((e) => e.toDomainModel()).toList());
  }

  @override
  Future<void> deleteComment({
    required String commentId,
  }) async {
    await remoteDataSourceCall(
      () => _api.deleteThematicGroupPostComment(
        commentId: commentId,
      ),
    );
  }

  @override
  Future<void> deleteReply({
    required String replyId,
  }) async {
    await remoteDataSourceCall(
      () => _api.deleteThematicGroupPostReply(
        replyId: replyId,
      ),
    );
  }

  @override
  Future<ThematicGroupPostCommentReply> createReply({
    required String commentId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.createThematicGroupPostPostReply(
        commentId: commentId.toIntOrThrow(),
        description: text,
        uploadedFile: image != null ? File.fromUri(image) : null,
        uploadedVideo: video != null ? File.fromUri(video) : null,
      ),
    );
    return result.toDomainModel();
  }

  @override
  Future<ThematicGroupPostCommentReply> updateReply({
    required String replyId,
    required String commentId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    final result = await remoteDataSourceCall(
      () => _api.updateThematicGroupPostPostReply(
        replyId: replyId.toIntOrThrow(),
        commentId: commentId.toIntOrThrow(),
        description: text,
        uploadedFile: image != null ? File.fromUri(image) : null,
        uploadedVideo: video != null ? File.fromUri(video) : null,
      ),
    );
    return result.toDomainModel();
  }
}
