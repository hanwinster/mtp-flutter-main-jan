part of 'course_detail_bloc.dart';

final class CourseDetailState extends Equatable {
  const CourseDetailState({
    required this.courseId,
    required this.isEnrolled,
    required this.isOfflineMode,
    this.courseUiState = const UiStateInitial(),
    this.enrolledUiState = const UiStateInitial(),
    this.courseDownloadUiState = const UiStateInitial(),
    this.resourceDownloadUiState = const UiStateInitial(),
  });

  final String courseId;
  final bool isEnrolled;
  final bool isOfflineMode;
  final UiState<Course> courseUiState;
  final UiState<CourseLearner> enrolledUiState;
  final UiState<CourseDownloadStatus> courseDownloadUiState;
  final UiState<String> resourceDownloadUiState;

  factory CourseDetailState.create({
    required String courseId,
    required bool isEnrolled,
    required bool isOfflineMode,
  }) {
    return CourseDetailState(
      courseId: courseId,
      isEnrolled: isEnrolled,
      isOfflineMode: isOfflineMode,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        isEnrolled,
        courseUiState,
        enrolledUiState,
        courseDownloadUiState,
        resourceDownloadUiState,
      ];

  CourseDetailState copyWith({
    String? courseId,
    bool? isEnrolled,
    bool? isOfflineMode,
    UiState<Course>? courseUiState,
    UiState<CourseLearner>? enrolledUiState,
    UiState<CourseDownloadStatus>? courseDownloadUiState,
    UiState<String>? resourceDownloadUiState,
  }) {
    return CourseDetailState(
      isEnrolled: isEnrolled ?? this.isEnrolled,
      courseId: courseId ?? this.courseId,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
      courseUiState: courseUiState ?? this.courseUiState,
      enrolledUiState: enrolledUiState ?? this.enrolledUiState,
      courseDownloadUiState: courseDownloadUiState ?? this.courseDownloadUiState,
      resourceDownloadUiState: resourceDownloadUiState ?? this.resourceDownloadUiState,
    );
  }
}