part of 'lecture_bloc.dart';

final class LectureState extends Equatable {
  const LectureState({
    required this.lectureId,
    required this.courseId,
    required this.materialKey,
    required this.isOfflineMode,
    this.lectureUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
  });

  final String lectureId;
  final String courseId;
  final String materialKey;
  final bool isOfflineMode;
  final UiState<UiLecture> lectureUiState;
  final UiState<CourseLearner> courseLearnerUiState;

  factory LectureState.create({
    required String courseId,
    required String lectureId,
    required String materialKey,
    required bool isOfflineMode,
  }) {
    return LectureState(
      lectureId: lectureId,
      courseId: courseId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
  }

  @override
  List<Object> get props => [
        lectureId,
        courseId,
        materialKey,
        lectureUiState,
        courseLearnerUiState,
        isOfflineMode,
      ];

  LectureState copyWith({
    String? lectureId,
    String? courseId,
    String? materialKey,
    UiState<UiLecture>? lectureUiState,
    UiState<CourseLearner>? courseLearnerUiState,
    bool? isOfflineMode,
  }) {
    return LectureState(
      lectureId: lectureId ?? this.lectureId,
      courseId: courseId ?? this.courseId,
      materialKey: materialKey ?? this.materialKey,
      lectureUiState: lectureUiState ?? this.lectureUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
    );
  }
}
