part of 'post_quiz_bloc.dart';

final class PostQuizState extends Equatable {
  const PostQuizState({
    required this.postId,
    this.currentPageIndex = 0,
    this.overallScore,
    this.questionsUiState = const UiStateInitial(),
    this.userAnswersSubmissionUiState = const UiStateInitial(),
  });

  final String postId;
  final int currentPageIndex;
  final double? overallScore;
  final UiState<List<BlogPostQuizQuestion>> questionsUiState;
  final UiState<BlogPostQuizUserAnswerResult> userAnswersSubmissionUiState;

  factory PostQuizState.create({
    required String postId,
  }) {
    return PostQuizState(
      postId: postId,
    );
  }

  @override
  List<Object?> get props => [
        postId,
        currentPageIndex,
        overallScore,
        questionsUiState,
        userAnswersSubmissionUiState,
      ];

  int get totalPages => questionsUiState.dataOrNull?.length ?? 0;

  PostQuizState copyWith({
    String? postId,
    int? currentPageIndex,
    double? overallScore,
    UiState<List<BlogPostQuizQuestion>>? questionsUiState,
    UiState<BlogPostQuizUserAnswerResult>? userAnswersSubmissionUiState,
  }) {
    return PostQuizState(
      postId: postId ?? this.postId,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      overallScore: overallScore ?? this.overallScore,
      questionsUiState: questionsUiState ?? this.questionsUiState,
      userAnswersSubmissionUiState:
          userAnswersSubmissionUiState ?? this.userAnswersSubmissionUiState,
    );
  }
}
