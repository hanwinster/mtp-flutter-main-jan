part of 'post_comment_reply_input_bloc.dart';

sealed class PostCommentReplyInputEvent extends Equatable {
  const PostCommentReplyInputEvent();
}

final class PostCommentReplyInputTextChanged extends PostCommentReplyInputEvent {
  const PostCommentReplyInputTextChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

final class PostCommentReplyInputMediaChanged extends PostCommentReplyInputEvent {
  const PostCommentReplyInputMediaChanged(this.value);

  final MediaValue value;

  @override
  List<Object> get props => [value];
}

final class PostCommentReplyInputMediaRemoved extends PostCommentReplyInputEvent {
  const PostCommentReplyInputMediaRemoved();

  @override
  List<Object> get props => [];
}

final class PostCommentReplyInputSubmitted extends PostCommentReplyInputEvent {
  const PostCommentReplyInputSubmitted();

  @override
  List<Object> get props => [];
}
