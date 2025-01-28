import 'dart:async';

import 'package:base/base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:ui/ui.dart';

import '../models/models.dart';

part 'post_comment_input_event.dart';

part 'post_comment_input_state.dart';

class PostCommentInputBloc
    extends Bloc<PostCommentInputEvent, PostCommentInputState> {
  PostCommentInputBloc({
    required String Id,
    required String type,
    CreateThematicGroupPostCommentUseCase? createGroupPostCommentUseCase,
    CreateGroupPostCommentReplyUseCase? createGroupPostCommentReplyUseCase,
  })  : _createGroupPostCommentUseCase = createGroupPostCommentUseCase ?? getIt(),
        _createGroupPostCommentReplyUseCase = createGroupPostCommentReplyUseCase ?? getIt(),
        super(PostCommentInputState.create(postId: Id,type: type)) {
    on<PostCommentInputTextChanged>(_handleTextChanged);
    on<PostCommentInputMediaChanged>(_handleMediaChanged);
    on<PostCommentInputMediaRemoved>(_handleMediaRemoved);
    on<PostCommentInputSubmitted>(_handleSubmitted);
  }

  final CreateThematicGroupPostCommentUseCase _createGroupPostCommentUseCase;
  final CreateGroupPostCommentReplyUseCase _createGroupPostCommentReplyUseCase;

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
    final imageState = PostCommentMediaState.newValue(
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
    final imageState = PostCommentMediaState.newValue(
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
    final validatedMediaState = PostCommentMediaState.validated(state.mediaState.value);

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
    await createComment(
      emit: emit,
      postId: state.postId,
      text: state.textState.value,
      image: imageUri,
      video: videoUri,
    );
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
        formSubmissionStatus: const UiStateInProgress(),
      ),
    );

    try {
      final Result result;
      PostCommentResult postCommentResult;

      // if (state.type == "post") {
      //   result = await _createGroupPostCommentUseCase(
      //     postid: postId.toIntOrThrow(),
      //     text: text,
      //     image: image,
      //     video: video,
      //   );
      //   postCommentResult = PostCommentResult(commentList: result.dataOrNull!);
      // } else {
      //   result = await _createGroupPostCommentReplyUseCase(
      //     commentId: postId.toIntOrThrow(),
      //     commentType: state.type,
      //     text: text,
      //     uploadedFile: image != null ? File.fromUri(image) : null
      //   );
      //   postCommentResult = PostCommentResult(reply: result.dataOrNull);
      // }

      // if (result is ResultSuccess) {
      //   emit(
      //     state.copyWith(
      //       formSubmissionStatus: UiStateSuccess(postCommentResult),
      //     ),
      //   );
      //   return;
      // } else {
      //   emit(state.copyWith(
      //     formSubmissionStatus: UiStateFailure.fromError(result),
      //   ));
      // }
    } catch (e, s) {
      logger.e(e.toString(), e, s);
      emit(
        state.copyWith(
          formSubmissionStatus: UiStateFailure.fromError(e),
        ),
      );
    }
  }

}



// Future<void> _processCreateCommentErrorResult({
//   required Emitter<PostCommentInputState> emit,
//   required CreateBlogPostCommentResult result,
// }) async {
//   switch (result) {
//     case CreateBlogPostCommentResultSuccess():
//       logger.e('Expected error result but got success');
//       break;
//     case CreateBlogPostCommentResultValidationError():
//       emit(
//         state.copyWith(
//           textError: () => result.textError.toFormValidationErrorOrNull(),
//           mediaError: () =>
//               result.imageError.toFormValidationErrorOrNull() ??
//               result.videoError.toFormValidationErrorOrNull(),
//           formSubmissionStatus: UiStateFailure.client(
//             result.message,
//             result,
//           ),
//         ),
//       );
//       break;
//   }
// }
