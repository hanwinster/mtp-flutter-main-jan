import 'dart:async';

import 'package:base/base.dart';
import 'package:blog/src/postcomment/input/models/models.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

part 'post_comment_input_event.dart';

part 'post_comment_input_state.dart';

class PostCommentInputBloc
    extends Bloc<PostCommentInputEvent, PostCommentInputState> {
  PostCommentInputBloc({
    required String postId,
    required BlogPostComment? comment,
    CreateBlogPostCommentUseCase? createBlogPostCommentUseCase,
    UpdateBlogPostCommentUseCase? updateBlogPostCommentUseCase,
  })  : _createBlogPostCommentUseCase = createBlogPostCommentUseCase ?? getIt(),
        _updateBlogPostCommentUseCase = updateBlogPostCommentUseCase ?? getIt(),
        super(PostCommentInputState.create(
          postId: postId,
          comment: comment,
        )) {
    on<PostCommentInputTextChanged>(_handleTextChanged);
    on<PostCommentInputMediaChanged>(_handleMediaChanged);
    on<PostCommentInputMediaRemoved>(_handleMediaRemoved);
    on<PostCommentInputSubmitted>(_handleSubmitted);
  }

  final CreateBlogPostCommentUseCase _createBlogPostCommentUseCase;
  final UpdateBlogPostCommentUseCase _updateBlogPostCommentUseCase;

  FutureOr<void> _handleTextChanged(
    PostCommentInputTextChanged event,
    Emitter<PostCommentInputState> emit,
  ) async {
    final textState = TextState.newValue(
      state.textState,
      event.text,
    );
    emit(
      state.copyWith(
        textState: textState,
        textError: () => textState.displayError,
      ),
    );
  }

  FutureOr<void> _handleMediaChanged(
    PostCommentInputMediaChanged event,
    Emitter<PostCommentInputState> emit,
  ) async {
    final imageState = MediaState.newValue(
      state.mediaState,
      event.value,
    );
    emit(
      state.copyWith(
        mediaState: imageState,
        mediaError: () => imageState.displayError,
      ),
    );
  }

  FutureOr<void> _handleMediaRemoved(
    PostCommentInputMediaRemoved event,
    Emitter<PostCommentInputState> emit,
  ) async {
    final imageState = MediaState.newValue(
      state.mediaState,
      null,
    );
    emit(
      state.copyWith(
        mediaState: imageState,
        mediaError: () => imageState.displayError,
      ),
    );
  }

  FutureOr<void> _handleSubmitted(
    PostCommentInputSubmitted event,
    Emitter<PostCommentInputState> emit,
  ) async {
    if (state.isEmptyComment) {
      return;
    }

    final validatedTextState = TextState.validated(state.textState.value);
    final validatedMediaState = MediaState.validated(state.mediaState.value);

    emit(
      state.copyWith(
        textState: validatedTextState,
        textError: () => validatedTextState.error,
        mediaState: validatedMediaState,
        mediaError: () => validatedMediaState.error,
      ),
    );

    if (!state.isValid) {
      return;
    }

    final mediaState = state.mediaState.value;
    Uri? imageUri;
    Uri? videoUri;
    if (mediaState != null) {
      final (:type, :uri) = mediaState;
      if (type == PostCommentMediaType.image) {
        imageUri = uri;
      } else if (type == PostCommentMediaType.video) {
        videoUri = uri;
      }
    }

    if (state.isInEditMode) {
      await updateComment(
        emit: emit,
        commentId: state.comment!.id,
        postId: state.postId,
        text: state.textState.value,
        image: imageUri,
        video: videoUri,
      );
    } else {
      await createComment(
        emit: emit,
        postId: state.postId,
        text: state.textState.value,
        image: imageUri,
        video: videoUri,
      );
    }
  }

  Future<void> createComment({
    required Emitter<PostCommentInputState> emit,
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    emit(
      state.copyWith(
        commentCreatingStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _createBlogPostCommentUseCase(
        CreateBlogPostCommentRequest(
          postId: postId,
          text: text,
          image: image,
          video: video,
        ),
      );

      if (result.isSuccessful) {
        emit(
          state.copyWith(
            commentCreatingStatus: UiStateSuccess(result),
          ),
        );
        return;
      } else {
        await _processCreateCommentErrorResult(
          emit: emit,
          result: result,
        );
      }
    } catch (e, s) {
      logger.e(e.toString(), e, s);
      emit(
        state.copyWith(
          commentCreatingStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _processCreateCommentErrorResult({
    required Emitter<PostCommentInputState> emit,
    required CreateBlogPostCommentResult result,
  }) async {
    switch (result) {
      case CreateBlogPostCommentResultSuccess():
        logger.e('Expected error result but got success');
        break;
      case CreateBlogPostCommentResultValidationError():
        emit(
          state.copyWith(
            textError: () => result.textError.toFormValidationErrorOrNull(),
            mediaError: () =>
                result.imageError.toFormValidationErrorOrNull() ??
                result.videoError.toFormValidationErrorOrNull(),
            commentCreatingStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
        break;
    }
  }

  Future<void> updateComment({
    required Emitter<PostCommentInputState> emit,
    required String commentId,
    required String postId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    emit(
      state.copyWith(
        commentUpdatingStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _updateBlogPostCommentUseCase(
        UpdateBlogPostCommentRequest(
          commentId: commentId,
          postId: postId,
          text: text,
          image: image,
          video: video,
        ),
      );

      if (result.isSuccessful) {
        emit(
          state.copyWith(
            commentUpdatingStatus: UiStateSuccess(result),
          ),
        );
        return;
      } else {
        await _processUpdateCommentErrorResult(
          emit: emit,
          result: result,
        );
      }
    } catch (e, s) {
      logger.e(e.toString(), e, s);
      emit(
        state.copyWith(
          commentUpdatingStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> _processUpdateCommentErrorResult({
    required Emitter<PostCommentInputState> emit,
    required UpdateBlogPostCommentResult result,
  }) async {
    switch (result) {
      case UpdateBlogPostCommentResultSuccess():
        logger.e('Expected error result but got success');
        break;
      case UpdateBlogPostCommentResultValidationError():
        emit(
          state.copyWith(
            textError: () => result.textError.toFormValidationErrorOrNull(),
            mediaError: () =>
            result.imageError.toFormValidationErrorOrNull() ??
                result.videoError.toFormValidationErrorOrNull(),
            commentUpdatingStatus: UiStateFailure.client(
              result.message,
              result,
            ),
          ),
        );
        break;
    }
  }

}
