part of 'post_list_bloc.dart';

class PostListState extends Equatable {
  const PostListState({
    this.filter = const PostListFilterAll(),
    this.postsUiState = const UiStateInitial(),
  });

  final PostListFilter filter;
  final UiState<List<BlogPost>> postsUiState;

  factory PostListState.create({
    required PostListFilter filter,
  }) {
    return PostListState(
      filter: filter,
    );
  }

  @override
  List<Object> get props => [filter, postsUiState];

  PostListState copyWith({
    PostListFilter? filter,
    UiState<List<BlogPost>>? postsUiState,
  }) {
    return PostListState(
      filter: filter ?? this.filter,
      postsUiState: postsUiState ?? this.postsUiState,
    );
  }
}
