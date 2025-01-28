part of 'my_courses_bloc.dart';

const pageSize = 20;
const firstPageKey = 1;

final class MyCoursesState extends Equatable {
  const MyCoursesState({
    this.currentPageIndex = 0,
    this.ongoingCoursesUiState = const UiStateInitial(),
    this.completedCoursesUiState = const UiStateInitial(),
    this.courseCancellationUiState = const UiStateInitial(),
  });

  final int currentPageIndex;
  final UiState<List<Course>> ongoingCoursesUiState;
  final UiState<List<Course>> completedCoursesUiState;
  final UiState<String> courseCancellationUiState;

  @override
  List<Object> get props =>
      [
        currentPageIndex,
        ongoingCoursesUiState,
        completedCoursesUiState,
        courseCancellationUiState,
      ];

  MyCoursesState copyWith({
    int? currentPageIndex,
    UiState<List<Course>>? ongoingCoursesUiState,
    UiState<List<Course>>? completedCoursesUiState,
    UiState<String>? courseCancellationUiState,
  }) {
    return MyCoursesState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      ongoingCoursesUiState:
          ongoingCoursesUiState ?? this.ongoingCoursesUiState,
      completedCoursesUiState:
          completedCoursesUiState ?? this.completedCoursesUiState,
      courseCancellationUiState:
          courseCancellationUiState ?? this.courseCancellationUiState,
    );
  }
}
