import 'dart:async';

import 'package:base/base.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

import '../models/models.dart';

part 'post_comment_reply_input_event.dart';

part 'post_comment_reply_input_state.dart';

class PostCommentReplyInputBloc
    extends Bloc<PostCommentReplyInputEvent, PostCommentReplyInputState> {
  PostCommentReplyInputBloc({
    required String postId,
    required ThematicGroupPostComment? replyToComment,
    required ThematicGroupPostCommentReply? reply,
    CreateGroupPostCommentReplyUseCase? createGroupPostCommentReplyUseCase,
    UpdateGroupPostCommentReplyUseCase? updateGroupPostCommentReplyUseCase,
  })  : _createGroupPostCommentReplyUseCase =
            createGroupPostCommentReplyUseCase ?? getIt(),
        _updateGroupPostCommentReplyUseCase =
            updateGroupPostCommentReplyUseCase ?? getIt(),
        super(PostCommentReplyInputState.create(
          postId: postId,
          replyToComment: replyToComment,
          reply: reply,
        )) {
    on<PostCommentReplyInputTextChanged>(_handleTextChanged);
    on<PostCommentReplyInputMediaChanged>(_handleMediaChanged);
    on<PostCommentReplyInputMediaRemoved>(_handleMediaRemoved);
    on<PostCommentReplyInputSubmitted>(_handleSubmitted);
  }

  final CreateGroupPostCommentReplyUseCase _createGroupPostCommentReplyUseCase;
  final UpdateGroupPostCommentReplyUseCase _updateGroupPostCommentReplyUseCase;

  FutureOr<void> _handleTextChanged(
    PostCommentReplyInputTextChanged event,
    Emitter<PostCommentReplyInputState> emit,
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
    PostCommentReplyInputMediaChanged event,
    Emitter<PostCommentReplyInputState> emit,
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
    PostCommentReplyInputMediaRemoved event,
    Emitter<PostCommentReplyInputState> emit,
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
    PostCommentReplyInputSubmitted event,
    Emitter<PostCommentReplyInputState> emit,
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
      await updateReply(
        emit: emit,
        postId: state.postId,
        replyId: state.reply!.id,
        replyToCommentId: state.replyToComment!.id,
        text: state.textState.value,
        image: imageUri,
        video: videoUri,
      );
    } else {
      await createReply(
        emit: emit,
        postId: state.postId,
        replyToCommentId: state.replyToComment!.id,
        text: state.textState.value,
        image: imageUri,
        video: videoUri,
      );
    }
  }

  Future<void> createReply({
    required Emitter<PostCommentReplyInputState> emit,
    required String postId,
    required String replyToCommentId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    emit(
      state.copyWith(
        replyCreatingStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _createGroupPostCommentReplyUseCase(
        postId: state.postId,
        commentId: replyToCommentId,
        text: text,
        image: image,
        video: video,
      );
      emit(
        state.copyWith(
          replyCreatingStatus: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Error creating reply', e, s);
      emit(
        state.copyWith(
          replyCreatingStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }

  Future<void> updateReply({
    required Emitter<PostCommentReplyInputState> emit,
    required String postId,
    required String replyId,
    required String replyToCommentId,
    required String text,
    required Uri? image,
    required Uri? video,
  }) async {
    emit(
      state.copyWith(
        replyUpdatingStatus: const UiStateInProgress(),
      ),
    );

    try {
      final result = await _updateGroupPostCommentReplyUseCase(
        postId: state.postId,
        replyId: replyId,
        commentId: replyToCommentId,
        text: text,
        image: image,
        video: video,
      );
      emit(
        state.copyWith(
          replyUpdatingStatus: UiStateSuccess(result),
        ),
      );
    } catch (e, s) {
      logger.e('Error creating reply', e, s);
      emit(
        state.copyWith(
          replyUpdatingStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }
}
