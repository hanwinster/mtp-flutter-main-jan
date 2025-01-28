part of 'post_quiz_bloc.dart';

sealed class PostQuizEvent extends Equatable {
  const PostQuizEvent();
}

class PostQuizQuestionsFetched extends PostQuizEvent {
  const PostQuizQuestionsFetched();

  @override
  List<Object> get props => [];
}

class PostQuizPageIndexChanged extends PostQuizEvent {
  const PostQuizPageIndexChanged(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}

class PostQuizUserAnsweredSubmitted extends PostQuizEvent {
  const PostQuizUserAnsweredSubmitted();

  @override
  List<Object> get props => [];
}