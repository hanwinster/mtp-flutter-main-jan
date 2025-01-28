part of 'blog_bloc.dart';

final class BlogState extends Equatable {
  const BlogState({
    this.categoriesUiState = const UiStateInitial(),
    this.latestPostsUiState = const UiStateInitial(),
    this.filteredPostsUiState = const UiStateInitial(),
    this.filter = const BlogFilter(),
  });

  final UiState<List<SelectableCategoryItemState>> categoriesUiState;
  final UiState<List<BlogPost>> latestPostsUiState;
  final UiState<List<BlogPost>> filteredPostsUiState;
  final BlogFilter filter;

  factory BlogState.empty() {
    return const BlogState();
  }

  @override
  List<Object?> get props => [
        categoriesUiState,
        latestPostsUiState,
        filteredPostsUiState,
        filter,
      ];

  BlogState copyWith({
    UiState<List<SelectableCategoryItemState>>? categoriesUiState,
    UiState<List<BlogPost>>? latestPostsUiState,
    UiState<List<BlogPost>>? filteredPostsUiState,
    BlogFilter? filter,
  }) {
    return BlogState(
      categoriesUiState: categoriesUiState ?? this.categoriesUiState,
      latestPostsUiState: latestPostsUiState ?? this.latestPostsUiState,
      filteredPostsUiState: filteredPostsUiState ?? this.filteredPostsUiState,
      filter: filter ?? this.filter,
    );
  }
}
