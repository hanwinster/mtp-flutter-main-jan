part of 'course_navigation_bloc.dart';

final class CourseNavigationState extends Equatable {
  const CourseNavigationState({
    required this.courseId,
    required this.materialKey,
    required this.isOfflineMode,
    this.navigationState = const UiStateInitial(),
  });

  final String courseId;
  final String materialKey;
  final bool isOfflineMode;
  final UiState<UiCourseNavigationResult> navigationState;

  factory CourseNavigationState.create({
    required String courseId,
    required String materialKey,
    required bool isOfflineMode,
  }) {
    return CourseNavigationState(
      courseId: courseId,
      materialKey: materialKey,
      isOfflineMode: isOfflineMode,
    );
  }

  @override
  List<Object> get props => [
        courseId,
        materialKey,
        navigationState,
        isOfflineMode,
      ];

  CourseNavigationState copyWith({
    String? courseId,
    String? materialKey,
    UiState<UiCourseNavigationResult>? navigationState,
    bool? isOfflineMode,
  }) {
    return CourseNavigationState(
      courseId: courseId ?? this.courseId,
      materialKey: materialKey ?? this.materialKey,
      navigationState: navigationState ?? this.navigationState,
      isOfflineMode: isOfflineMode ?? this.isOfflineMode,
    );
  }
}
