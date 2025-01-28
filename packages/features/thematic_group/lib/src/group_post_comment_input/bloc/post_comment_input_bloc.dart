import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

import '../models/models.dart';

part 'post_comment_input_event.dart';

part 'post_comment_input_state.dart';

class PostCommentInputBloc
    extends Bloc<PostCommentInputEvent, PostCommentInputState> {
  PostCommentInputBloc({
    required String postId,
    required ThematicGroupPostComment? replyToComment,
    required ThematicGroupPostComment? comment,
    CreateThematicGroupPostCommentUseCase? createGroupPostCommentUseCase,
    UpdateThematicGroupPostCommentUseCase? updateGroupPostCommentUseCase,
  })  : _createGroupPostCommentUseCase =
            createGroupPostCommentUseCase ?? getIt(),
        _updateGroupPostCommentUseCase =
            updateGroupPostCommentUseCase ?? getIt(),
        super(PostCommentInputState.create(
          postId: postId,
          replyToComment: replyToComment,
          comment: comment,
        )) {
    on<PostCommentInputTextChanged>(_handleTextChanged);
    on<PostCommentInputMediaChanged>(_handleMediaChanged);
    on<PostCommentInputMediaRemoved>(_handleMediaRemoved);
    on<PostCommentInputSubmitted>(_handleSubmitted);
  }

  final CreateThematicGroupPostCommentUseCase _createGroupPostCommentUseCase;
  final UpdateThematicGroupPostCommentUseCase _updateGroupPostCommentUseCase;

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
      final result = await _createGroupPostCommentUseCase(
        postId: state.postId,
        text: text,
        image: image,
        video: video,
      );
      emit(
        state.copyWith(
          commentCreatingStatus: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Error creating comment', e, s);
      emit(
        state.copyWith(
          commentCreatingStatus: UiStateFailure.fromError(e),
        ),
      );
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
      final result = await _updateGroupPostCommentUseCase(
        commentId: commentId,
        postId: postId,
        text: text,
        image: image,
        video: video,
      );

      final updatedComment = state.comment?.copyWith(
        description: text,
      );
      if (updatedComment != null) {
        emit(
          state.copyWith(
            commentUpdatingStatus: UiStateSuccess(updatedComment),
          ),
        );
      }
    } catch (e, s) {
      logger.e('Error updating comment', e, s);
      emit(
        state.copyWith(
          commentUpdatingStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
