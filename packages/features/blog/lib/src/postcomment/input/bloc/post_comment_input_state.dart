part of 'post_comment_input_bloc.dart';

enum CommentInputType {
  text,
  image,
  video,
}

final class PostCommentInputState extends Equatable with FormzMixin {
  const PostCommentInputState({
    required this.postId,
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
  final CommentInputType commentInputType;
  final TextState textState;
  final FormFieldValidationError? textError;
  final MediaState mediaState;
  final FormFieldValidationError? mediaError;
  final UiState<CreateBlogPostCommentResult> commentCreatingStatus;
  final UiState<UpdateBlogPostCommentResult> commentUpdatingStatus;
  final BlogPostComment? comment;

  factory PostCommentInputState.create({
    required String postId,
    required BlogPostComment? comment,
  }) {
    logger.d('PostCommentInputState.create: $comment');
    return PostCommentInputState(
      postId: postId,
      comment: comment,
      textState: TextState.unvalidated(comment?.text ?? ''),
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
    UiState<CreateBlogPostCommentResult>? commentCreatingStatus,
    UiState<UpdateBlogPostCommentResult>? commentUpdatingStatus,
    BlogPostComment? comment,
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
      comment: comment ?? this.comment,
    );
  }
}
