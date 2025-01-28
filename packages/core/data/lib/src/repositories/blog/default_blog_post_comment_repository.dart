import 'dart:io';

import 'package:api/api.dart';
import 'package:base/base.dart';
import 'package:data/src/mappers/mappers.dart';
import 'package:data/src/util/network_bound_result.dart';
import 'package:database/database.dart';
import 'package:domain/domain.dart';

class DefaultBlogPostCommentRepository extends BlogPostCommentRepository {
  DefaultBlogPostCommentRepository({
    MtpApi? api,
    BlogPostCommentDao? commentDao,
    BlogPostDao? blogPostDao,
  })  : _api = api ?? getIt(),
        _blogPostDao = blogPostDao ?? getIt(),
        _commentDao = commentDao ?? getIt();

  final MtpApi _api;
  final BlogPostCommentDao _commentDao;
  final BlogPostDao _blogPostDao;

  final RateLimiter<String> rateLimiter =
      RateLimiter.create(10, TimeUnit.minutes);

  @override
  Stream<Result<List<BlogPostComment>>> observeComments({
    required String postId,
  }) {
    return NetworkBoundResult<List<BlogPostComment>, List<BlogPostCommentRM>>(
      createCall: () => remoteDataSourceCall(
        () => _api.getBlogPostComments(
          postId: postId.toIntOrThrow(),
        ),
      ),
      saveCallResult: (entities) async {
        logger.d('Entities: $entities');
        await _commentDao.deleteEntitiesByPostId(
          postId: postId,
        );
        await _commentDao.upsertEntities(
          entities: entities.map((e) => e.toEntity()).toList(),
        );
      },
      loadFromDb: () => _commentDao
          .observeEntities(postId: postId)
          .map((entities) => entities.map((e) => e.toDomainModel()).toList()),
      shouldFetch: (data) {
        return data == null || rateLimiter.shouldFetch('post-$postId-comments');
      },
      onFetchFailed: () async {
        rateLimiter.reset('post-$postId-comments');
      },
    ).asStream();
  }

  @override
  Future<CreateBlogPostCommentResult> createComment({
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    try {
      final response = await _api.createBlogPostComment(
        postId: postId.toIntOrThrow(),
        text: text,
        image: image != null ? File.fromUri(image) : null,
        video: video != null ? File.fromUri(video) : null,
      );

      await _commentDao.upsertEntity(entity: response.toEntity());
      await _blogPostDao.incrementCommentCount(postId: postId);
      return const CreateBlogPostCommentResultSuccess(message: '');
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = CreateBlogPostCommentErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
        );

        return CreateBlogPostCommentResultValidationError(
          message: errorResponse.message,
          textError: errorResponse.textError,
          imageError: errorResponse.imageError,
          videoError: errorResponse.videoError,
        );
      } else {
        logger.e('Error creating comment', e);
        throw e.toDomainException();
      }
    } catch (e, s) {
      logger.e('Error creating comment', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<UpdateBlogPostCommentResult> updateComment({
    required String commentId,
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    try {
      final response = await _api.updateBlogPostComment(
        commentId: commentId.toIntOrThrow(),
        postId: postId.toIntOrThrow(),
        text: text,
        image: image != null ? File.fromUri(image) : null,
        video: video != null ? File.fromUri(video) : null,
      );

      await _commentDao.upsertEntity(entity: response.toEntity());
      return const UpdateBlogPostCommentResultSuccess(message: '');
    } on ApiException catch (e) {
      if (e is ClientApiException) {
        final errorResponse = UpdateBlogPostCommentErrorResponseRM.create(
          message: e.message,
          errors: e.errors,
        );

        return UpdateBlogPostCommentResultValidationError(
          message: errorResponse.message,
          textError: errorResponse.textError,
          imageError: errorResponse.imageError,
          videoError: errorResponse.videoError,
        );
      } else {
        logger.e('Error updating comment', e);
        throw e.toDomainException();
      }
    } catch (e, s) {
      logger.e('Error updating comment', e, s);
      throw const UnknownDomainException();
    }
  }

  @override
  Future<void> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    try {
      await remoteDataSourceCall(
        () => _api.deleteBlogPostComment(
          commentId: commentId.toIntOrThrow(),
        ),
      );
      await _commentDao.deleteEntity(id: commentId);
      await _blogPostDao.decrementCommentCount(postId: postId);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> createReaction({
    required String commentId,
    required ReactionType reactionType,
  }) async {
    try {
      final response = await remoteDataSourceCall(
        () => _api.createBlogPostCommentReaction(
            commentId: commentId.toIntOrThrow(),
            reaction: ReactionTypeRM.fromDomainModel(reactionType).toJson()),
      );
      final comment = await _commentDao.getEntity(entityId: commentId);
      await _commentDao.upsertEntity(
        entity: comment.copyWith(
          currentReaction: () => response.toEntity(),
          numberOfReactions: comment.numberOfReactions + 1,
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteReaction({
    required String commentId,
    required String reactionId,
  }) async {
    try {
      await remoteDataSourceCall(
        () => _api.deleteBlogPostCommentReaction(
          commentId: commentId.toIntOrThrow(),
          reactionId: reactionId.toIntOrThrow(),
        ),
      );
      final oldComment = await _commentDao.getEntity(entityId: commentId);
      final updatedComment = oldComment.copyWith(
        currentReaction: () => null,
        numberOfReactions: oldComment.numberOfReactions - 1,
      );
      await _commentDao.upsertEntity(
        entity: updatedComment,
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> updateReaction({
    required String commentId,
    required String reactionId,
    required ReactionType reactionType,
  }) async {
    try {
      // Note: API will handle the update of the reaction
      // If there is no current reaction, the API will create a new one
      final response = await remoteDataSourceCall(
        () => _api.updateBlogPostCommentReaction(
          commentId: commentId.toIntOrThrow(),
          reactionId: reactionId.toIntOrThrow(),
          reaction: ReactionTypeRM.fromDomainModel(reactionType).toJson(),
        ),
      );
      final comment = await _commentDao.getEntity(entityId: commentId);
      await _commentDao.upsertEntity(
        entity: comment.copyWith(
          currentReaction: () => response.toEntity(),
        ),
      );
    } on Exception {
      rethrow;
    }
  }
}
