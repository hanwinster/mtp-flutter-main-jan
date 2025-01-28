part of 'post_comment_input_bloc.dart';

enum CommentInputType {
  text,
  image,
  video,
}

class PostCommentResult {
  final ThematicGroupPostComment? commentList;
  final ThematicGroupPostCommentReply? reply;

  PostCommentResult({
    this.commentList,
    this.reply,
  });

  bool get isComment => commentList != null;
  bool get isReply => reply != null;
}


final class PostCommentInputState extends Equatable with FormzMixin {
  const PostCommentInputState({
    required this.postId,
    required this.type,
    this.commentInputType = CommentInputType.text,
    this.textState = const TextState.unvalidated(),
    this.textError,
    this.mediaState = const PostCommentMediaState.unvalidated(),
    this.mediaError,
    this.formSubmissionStatus = const UiStateInitial(),
  });

  final String postId;
  final String type;
  final CommentInputType commentInputType;
  final TextState textState;
  final FormFieldValidationError? textError;
  final PostCommentMediaState mediaState;
  final FormFieldValidationError? mediaError;

  // Modify formSubmissionStatus to use PostCommentResult
  final UiState<PostCommentResult> formSubmissionStatus;

  factory PostCommentInputState.create({
    required String postId,
    required String type,
  }) {
    return PostCommentInputState(
      postId: postId,
      type: type,
    );
  }

  bool get isEmptyComment =>
      textState.value.isEmpty && mediaState.value == null;

  @override
  List<Object?> get props => [
    postId,
    commentInputType,
    textState,
    textError,
    mediaState,
    mediaError,
    formSubmissionStatus,
  ];

  @override
  List<FormzInput> get inputs => [];

  bool get isFormSubmissionInProgress =>
      formSubmissionStatus is UiStateInProgress;

  bool get isFormSubmissionSuccess =>
      formSubmissionStatus is UiStateSuccess<PostCommentResult>;

  bool get isFormSubmissionFailure =>
      formSubmissionStatus is UiStateFailure;

  PostCommentInputState copyWith({
    String? postId,
    String? type,
    CommentInputType? commentInputType,
    TextState? textState,
    ValueGetter<FormFieldValidationError?>? textError,
    PostCommentMediaState? mediaState,
    ValueGetter<FormFieldValidationError?>? mediaError,
    UiState<PostCommentResult>? formSubmissionStatus,
  }) {
    return PostCommentInputState(
      postId: postId ?? this.postId,
      type: type ?? this.type,
      commentInputType: commentInputType ?? this.commentInputType,
      textState: textState ?? this.textState,
      textError: textError != null ? textError() : this.textError,
      mediaState: mediaState ?? this.mediaState,
      mediaError: mediaError != null ? mediaError() : this.mediaError,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}

