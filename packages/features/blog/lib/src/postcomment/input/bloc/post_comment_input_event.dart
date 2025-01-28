part of 'post_comment_input_bloc.dart';

sealed class PostCommentInputEvent extends Equatable {
  const PostCommentInputEvent();
}

final class PostCommentInputTextChanged extends PostCommentInputEvent {
  const PostCommentInputTextChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

final class PostCommentInputMediaChanged extends PostCommentInputEvent {
  const PostCommentInputMediaChanged(this.value);

  final MediaValue value;

  @override
  List<Object> get props => [value];
}

final class PostCommentInputMediaRemoved extends PostCommentInputEvent {
  const PostCommentInputMediaRemoved();

  @override
  List<Object> get props => [];
}

final class PostCommentInputSubmitted extends PostCommentInputEvent {
  const PostCommentInputSubmitted();

  @override
  List<Object> get props => [];
}
