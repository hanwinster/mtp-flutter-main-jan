part of 'assessment_bloc.dart';

final class AssessmentState extends Equatable {
  const AssessmentState({
    required this.courseId,
    required this.assessmentQuestionId,
    required this.materialKey,
    required this.isOfflineMode,
    this.questionUiState = const UiStateInitial(),
    this.questionsUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
    this.saveAssessmentUiState = const UiStateInitial(),
    this.assessmentSubmissionUiState = const UiStateInitial(),
    this.isLastQuestion = false,
    this.isSubmittable = false,
    this.showCorrectAnswers = false,
  });

  final String courseId;
  final String assessmentQuestionId;
  final String materialKey;
  final bool isOfflineMode;
  final UiState<AssessmentQuestion> questionUiState;
  final UiState<List<AssessmentQuestion>> questionsUiState;
  final UiState<CourseLearner> courseLearnerUiState;
  final UiState<NullValue> saveAssessmentUiState;
  final UiState<AssessmentSubmissionResult> assessmentSubmissionUiState;
  final bool isLastQuestion;
  final bool isSubmittable;
  final bool showCorrectAnswers;

  factory AssessmentState.create({
    required String courseId,
    required String assessmentQuestionId,
    required String materialKey,
    required bool isOfflineMode,
  }) {
    return AssessmentState(
      courseId: courseId,
      assessmentQuestionId: assessmentQuestionId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
  }

  @override
  List<Object> get props =>
      [
        courseId,
        assessmentQuestionId,
        materialKey,
        questionUiState,
        questionsUiState,
        courseLearnerUiState,
        saveAssessmentUiState,
        assessmentSubmissionUiState,
        isLastQuestion,
        isSubmittable,
        isOfflineMode,
        showCorrectAnswers,
      ];

  bool get hasSavedAssessment => saveAssessmentUiState is UiStateSuccess;

  AssessmentState copyWith({
    String? courseId,
    String? assessmentQuestionId,
    String? materialKey,
    bool? isOfflineMode,
    UiState<AssessmentQuestion>? questionUiState,
    UiState<List<AssessmentQuestion>>? questionsUiState,
    UiState<CourseLearner>? courseLearnerUiState,
    UiState<NullValue>? saveAssessmentUiState,
    UiState<AssessmentSubmissionResult>? assessmentSubmissionUiState,
    bool? isLastQuestion,
    bool? isSubmittable,
    bool? showCorrectAnswers,
  }) {
    return AssessmentState(
      courseId: courseId ?? this.courseId,
      assessmentQuestionId: assessmentQuestionId ?? this.assessmentQuestionId,
      materialKey: materialKey ?? this.materialKey,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
      questionUiState: questionUiState ?? this.questionUiState,
      questionsUiState: questionsUiState ?? this.questionsUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
      saveAssessmentUiState:
          saveAssessmentUiState ?? this.saveAssessmentUiState,
      assessmentSubmissionUiState:
          assessmentSubmissionUiState ?? this.assessmentSubmissionUiState,
      isLastQuestion: isLastQuestion ?? this.isLastQuestion,
      isSubmittable: isSubmittable ?? this.isSubmittable,
      showCorrectAnswers: showCorrectAnswers ?? this.showCorrectAnswers,
    );
  }
}
