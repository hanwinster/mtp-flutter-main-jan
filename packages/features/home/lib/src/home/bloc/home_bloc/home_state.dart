part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.courseCategoriesUiState = const UiStateInitial(),
    this.coursesUiState = const UiStateInitial(),
    this.versionUiState = const UiStateInitial(),
  });
  final UiState<List<CourseCategory>> courseCategoriesUiState;
  final UiState<List<Course>> coursesUiState;
  final UiState<Version> versionUiState;

  factory HomeState.empty() => const HomeState();

  @override
  List<Object?> get props => [
        courseCategoriesUiState,
        coursesUiState,
        versionUiState,
      ];

  HomeState copyWith({
    UiState<List<CourseCategory>>? courseCategoriesUiState,
    UiState<List<Course>>? coursesUiState,
    UiState<Version>? versionUiState,
  }) {
    return HomeState(
      courseCategoriesUiState: courseCategoriesUiState ?? this.courseCategoriesUiState,
      coursesUiState: coursesUiState ?? this.coursesUiState,
      versionUiState: versionUiState ?? this.versionUiState,
    );
  }
}