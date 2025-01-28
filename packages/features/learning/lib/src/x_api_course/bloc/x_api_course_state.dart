part of 'x_api_course_bloc.dart';

final class XApiCourseState extends Equatable {
  const XApiCourseState({
    required this.courseId,
    required this.materialKey,
    required this.isOfflineMode,
    this.courseUiState = const UiStateInitial(),
    this.completedUiState = const UiStateInitial(),
    this.courseLearnerUiState = const UiStateInitial(),
  });

  final String courseId;
  final String materialKey;
  final bool isOfflineMode;
  final UiState<XApiCourse> courseUiState;
  final UiState<XApiCourse> completedUiState;
  final UiState<CourseLearner> courseLearnerUiState;

  factory XApiCourseState.create({
    required String courseId,
    required String materialKey,
    required bool isOfflineMode,
  }) {
    return XApiCourseState(
      courseId: courseId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
  }

  String get launchLink => courseUiState.dataOrNull?.launchLink ?? '';

  @override
  List<Object> get props =>
      [
        courseId,
        materialKey,
        courseUiState,
        completedUiState,
        courseLearnerUiState,
        isOfflineMode,
      ];

  XApiCourseState copyWith({
    String? courseId,
    String? materialKey,
    UiState<XApiCourse>? courseUiState,
    UiState<XApiCourse>? completedUiState,
    UiState<CourseLearner>? courseLearnerUiState,
    bool? isOfflineMode,
  }) {
    return XApiCourseState(
      courseId: courseId ?? this.courseId,
      materialKey: materialKey ?? this.materialKey,
      courseUiState: courseUiState ?? this.courseUiState,
      completedUiState: completedUiState ?? this.completedUiState,
      courseLearnerUiState: courseLearnerUiState ?? this.courseLearnerUiState,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
    );
  }
}