part of 'post_quiz_question_bloc.dart';

sealed class PostQuizQuestionEvent extends Equatable {
  const PostQuizQuestionEvent();
}

class PostQuizQuestionSubmitted extends PostQuizQuestionEvent {
  const PostQuizQuestionSubmitted(
    this.answersByQuestionId,
  );

  final Map<String, UserAnswer> answersByQuestionId;

  @override
  List<Object> get props => [answersByQuestionId];
}