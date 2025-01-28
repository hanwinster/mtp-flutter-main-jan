part of 'quiz_bloc.dart';

final class QuizState extends Equatable {
  const QuizState({
    required this.courseId,
    required this.quizId,
    required this.materialKey,
    this.quizUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
    this.answerSubmissionUiState = const UiStateInitial(),
    required this.isOfflineMode,
    this.hasAnswered = false,
  });

  final String courseId;
  final String materialKey;
  final String quizId;
  final UiState<LearningQuiz> quizUiState;
  final UiState<String> answerSubmissionUiState;
  final UiState<CourseLearner> courseLearnerUiState;
final bool isOfflineMode;
  final bool hasAnswered;

  factory QuizState.create({
    required String courseId,
    required String quizId,
    required String materialKey,
    required bool isOfflineMode,
  }) {
    return QuizState(
      courseId: courseId,
      quizId: quizId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
  }

  @override
  List<Object> get props =>
      [
        courseId,
        materialKey,
        quizId,
        quizUiState,
        answerSubmissionUiState,
        courseLearnerUiState,
        isOfflineMode,
        hasAnswered,
      ];

  QuizState copyWith({
    String? courseId,
    String? materialKey,
    String? quizId,
    UiState<LearningQuiz>? quizUiState,
    UiState<String>? answerSubmissionUiState,
    UiState<CourseLearner>? courseLearnerUiState,
    bool? isOfflineMode,
    bool? hasAnswered,
  }) {
    return QuizState(
      courseId: courseId ?? this.courseId,
      materialKey: materialKey ?? this.materialKey,
      quizId: quizId ?? this.quizId,
      quizUiState: quizUiState ?? this.quizUiState,
      answerSubmissionUiState:
          answerSubmissionUiState ?? this.answerSubmissionUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
      hasAnswered: hasAnswered ?? this.hasAnswered,
    );
  }
}
