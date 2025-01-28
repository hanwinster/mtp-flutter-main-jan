part of 'post_comment_input_bloc.dart';

enum CommentInputType {
  text,
  image,
  video,
}

final class PostCommentInputState extends Equatable with FormzMixin {
  const PostCommentInputState({
    required this.postId,
    required this.replyToComment,
    this.commentInputType = CommentInputType.text,
    this.textState = const TextState.unvalidated(),
    this.textError,
    this.mediaState = const MediaState.unvalidated(),
    this.mediaError,
    this.commentCreatingStatus = const UiStateInitial(),
    this.commentUpdatingStatus = const UiStateInitial(),
    this.comment,
  });

  final String postId;
  final ThematicGroupPostComment? replyToComment;
  final CommentInputType commentInputType;
  final TextState textState;
  final FormFieldValidationError? textError;
  final MediaState mediaState;
  final FormFieldValidationError? mediaError;
  final UiState<ThematicGroupPostComment> commentCreatingStatus;
  final UiState<ThematicGroupPostComment> commentUpdatingStatus;
  final ThematicGroupPostComment? comment;

  factory PostCommentInputState.create({
    required String postId,
    required ThematicGroupPostComment? replyToComment,
    required ThematicGroupPostComment? comment,
  }) {
    return PostCommentInputState(
      postId: postId,
      replyToComment: replyToComment,
      comment: comment,
      textState: TextState.unvalidated(comment?.description ?? ''),
    );
  }

  bool get isEmptyComment =>
      textState.value.isEmpty && mediaState.value == null;

  bool get isInEditMode => comment != null;

  @override
  List<Object?> get props => [
        postId,
        commentInputType,
        textState,
        textError,
        mediaState,
        mediaError,
        commentCreatingStatus,
        commentUpdatingStatus,
        replyToComment,
        comment,
      ];

  // we need to validate manually because all input can be empty
  @override
  List<FormzInput> get inputs => [];

  PostCommentInputState copyWith({
    String? postId,
    CommentInputType? commentInputType,
    TextState? textState,
    ValueGetter<FormFieldValidationError?>? textError,
    MediaState? mediaState,
    ValueGetter<FormFieldValidationError?>? mediaError,
    UiState<ThematicGroupPostComment>? commentCreatingStatus,
    UiState<ThematicGroupPostComment>? commentUpdatingStatus,
    ThematicGroupPostComment? replyToComment,
    ThematicGroupPostComment? comment,
  }) {
    return PostCommentInputState(
      postId: postId ?? this.postId,
      commentInputType: commentInputType ?? this.commentInputType,
      textState: textState ?? this.textState,
      textError: textError != null ? textError() : this.textError,
      mediaState: mediaState ?? this.mediaState,
      mediaError: mediaError != null ? mediaError() : this.mediaError,
      commentCreatingStatus:
          commentCreatingStatus ?? this.commentCreatingStatus,
      commentUpdatingStatus:
          commentUpdatingStatus ?? this.commentUpdatingStatus,
      replyToComment: replyToComment ?? this.replyToComment,
      comment: comment ?? this.comment,
    );
  }
}
