part of 'post_comment_reply_input_bloc.dart';

enum CommentInputType {
  text,
  image,
  video,
}

final class PostCommentReplyInputState extends Equatable with FormzMixin {
  const PostCommentReplyInputState({
    required this.postId,
    required this.replyToComment,
    this.commentInputType = CommentInputType.text,
    this.textState = const TextState.unvalidated(),
    this.textError,
    this.mediaState = const MediaState.unvalidated(),
    this.mediaError,
    this.replyCreatingStatus = const UiStateInitial(),
    this.replyUpdatingStatus = const UiStateInitial(),
    this.reply,
  });

  final String postId;
  final ThematicGroupPostComment? replyToComment;
  final CommentInputType commentInputType;
  final TextState textState;
  final FormFieldValidationError? textError;
  final MediaState mediaState;
  final FormFieldValidationError? mediaError;
  final UiState<ThematicGroupPostCommentReply> replyCreatingStatus;
  final UiState<ThematicGroupPostCommentReply> replyUpdatingStatus;
  final ThematicGroupPostCommentReply? reply;

  factory PostCommentReplyInputState.create({
    required String postId,
    required ThematicGroupPostComment? replyToComment,
    required ThematicGroupPostCommentReply? reply,
  }) {
    return PostCommentReplyInputState(
      postId: postId,
      replyToComment: replyToComment,
      reply: reply,
      textState: TextState.unvalidated(reply?.description ?? ''),
    );
  }

  bool get isEmptyComment =>
      textState.value.isEmpty && mediaState.value == null;

  bool get isInEditMode => reply != null;

  @override
  List<Object?> get props => [
        postId,
        commentInputType,
        textState,
        textError,
        mediaState,
        mediaError,
        replyCreatingStatus,
        replyUpdatingStatus,
        replyToComment,
        reply,
      ];

  // we need to validate manually because all input can be empty
  @override
  List<FormzInput> get inputs => [];

  PostCommentReplyInputState copyWith({
    String? postId,
    CommentInputType? commentInputType,
    TextState? textState,
    ValueGetter<FormFieldValidationError?>? textError,
    MediaState? mediaState,
    ValueGetter<FormFieldValidationError?>? mediaError,
    UiState<ThematicGroupPostCommentReply>? replyCreatingStatus,
    UiState<ThematicGroupPostCommentReply>? replyUpdatingStatus,
    ThematicGroupPostComment? replyToComment,
    ThematicGroupPostCommentReply? reply,
  }) {
    return PostCommentReplyInputState(
      postId: postId ?? this.postId,
      commentInputType: commentInputType ?? this.commentInputType,
      textState: textState ?? this.textState,
      textError: textError != null ? textError() : this.textError,
      mediaState: mediaState ?? this.mediaState,
      mediaError: mediaError != null ? mediaError() : this.mediaError,
      replyCreatingStatus:
          replyCreatingStatus ?? this.replyCreatingStatus,
      replyUpdatingStatus:
          replyUpdatingStatus ?? this.replyUpdatingStatus,
      replyToComment: replyToComment ?? this.replyToComment,
      reply: reply ?? this.reply,
    );
  }
}
