part of 'course_list_bloc.dart';

const pageSize = 10;
const firstPageKey = 1;

final class CourseListState extends Equatable {
  const CourseListState({
    required this.filter,
    this.currentPageKey = -1,
    this.coursesUiState = const UiStateInitial(),
  });

  final CourseFilter filter;
  final int currentPageKey;
  final UiState<List<Course>> coursesUiState;

  int? get nextPageKey => isLastPage ? null : currentPageKey + 1;

  bool get isFirstPage => currentPageKey == firstPageKey;

  bool get isLastPage => (coursesUiState.dataOrNull ?? []).length < pageSize;

  @override
  List<Object> get props => [
        filter,
        currentPageKey,
        coursesUiState,
      ];

  CourseListState copyWith({
    CourseFilter? filter,
    int? currentPageKey,
    UiState<List<Course>>? coursesUiState,
  }) {
    return CourseListState(
      filter: filter ?? this.filter,
      currentPageKey: currentPageKey ?? this.currentPageKey,
      coursesUiState: coursesUiState ?? this.coursesUiState,
    );
  }
}
