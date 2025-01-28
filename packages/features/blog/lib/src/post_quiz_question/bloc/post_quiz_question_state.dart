part of 'post_quiz_question_bloc.dart';

final class PostQuizQuestionState extends Equatable {
  final String postId;
  final int currentQuestionIndex;
  final bool isFirstQuestion;
  final bool isLastQuestion;
  final BlogPostQuizQuestion question;
  final UiState<NullValue> submissionUiState;

  const PostQuizQuestionState({
    required this.postId,
    required this.currentQuestionIndex,
    required this.isFirstQuestion,
    required this.isLastQuestion,
    required this.question,
    this.submissionUiState = const UiStateInitial(),
  });

  factory PostQuizQuestionState.create({
    required String postId,
    required int currentQuestionIndex,
    required bool isFirstQuestion,
    required bool isLastQuestion,
    required BlogPostQuizQuestion question,
  }) {
    return PostQuizQuestionState(
      postId: postId,
      currentQuestionIndex: currentQuestionIndex,
      isFirstQuestion: isFirstQuestion,
      isLastQuestion: isLastQuestion,
      question: question,
    );
  }

  @override
  List<Object> get props => [
        postId,
        currentQuestionIndex,
        isFirstQuestion,
        isLastQuestion,
        question,
        submissionUiState,
      ];

  PostQuizQuestionState copyWith({
    String? postId,
    int? currentQuestionIndex,
    bool? isFirstQuestion,
    bool? isLastQuestion,
    BlogPostQuizQuestion? question,
    UiState<NullValue>? submissionUiState,
  }) {
    return PostQuizQuestionState(
      postId: postId ?? this.postId,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isFirstQuestion: isFirstQuestion ?? this.isFirstQuestion,
      isLastQuestion: isLastQuestion ?? this.isLastQuestion,
      question: question ?? this.question,
      submissionUiState: submissionUiState ?? this.submissionUiState,
    );
  }
}
