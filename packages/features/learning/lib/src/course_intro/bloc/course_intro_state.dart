part of 'course_intro_bloc.dart';

final class CourseIntroState extends Equatable {
  const CourseIntroState({
    required this.courseId,
    required this.materialKey,
    required this.isOfflineMode,
    this.courseUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
  });

  final String courseId;
  final String materialKey;
  final bool isOfflineMode;
  final UiState<Course> courseUiState;
  final UiState<CourseLearner> courseLearnerUiState;

  factory CourseIntroState.create({
    required String courseId,
    required String materialKey,
  }) {
    return CourseIntroState(
      courseId: courseId,
      materialKey: materialKey,
      isOfflineMode: false,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        materialKey,
        isOfflineMode,
        courseUiState,
        courseLearnerUiState,
      ];

  CourseIntroState copyWith({
    String? courseId,
    String? materialKey,
    bool? isOfflineMode,
    UiState<Course>? courseUiState,
    UiState<CourseLearner>? courseLearnerUiState,
  }) {
    return CourseIntroState(
      courseId: courseId ?? this.courseId,
      materialKey: materialKey ?? this.materialKey,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
      courseUiState: courseUiState ?? this.courseUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
    );
  }
}
