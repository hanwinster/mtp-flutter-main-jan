part of 'summary_bloc.dart';

final class SummaryState extends Equatable {
  const SummaryState({
    required this.courseId,
    required this.summaryId,
    required this.materialKey,
    required this.isOfflineMode,
    this.summaryUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
  });

  final String courseId;
  final String summaryId;
  final String materialKey;
  final bool isOfflineMode;
  final UiState<UiSummary> summaryUiState;
  final UiState<CourseLearner> courseLearnerUiState;

  factory SummaryState.create({
    required String courseId,
    required String summaryId,
    required String materialKey,
    required bool isOfflineMode,
  }) {
    return SummaryState(
      courseId: courseId,
      summaryId: summaryId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        summaryId,
        materialKey,
        summaryUiState,
        courseLearnerUiState,
        isOfflineMode,
      ];

  SummaryState copyWith({
    String? courseId,
    String? summaryId,
    String? materialKey,
    UiState<UiSummary>? summaryUiState,
    UiState<CourseLearner>? courseLearnerUiState,
    bool? isOfflineMode,
  }) {
    return SummaryState(
      courseId: courseId ?? this.courseId,
      summaryId: summaryId ?? this.summaryId,
      materialKey: materialKey ?? this.materialKey,
      summaryUiState: summaryUiState ?? this.summaryUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
    );
  }
}
