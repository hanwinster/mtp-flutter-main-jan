part of 'posts_bloc.dart';

class PostsState extends Equatable {
  const PostsState({
    this.reactionUiState = const UiStateInitial(),
    this.postsUiState = const UiStateInitial(),
    this.postDeleteUiState = const UiStateInitial(),
    this.userUiState = const UiStateInitial(),
    this.posts = const [],
    this.page = 1,
    this.hasReachedMax = false,
  });

  final UiState<List<ThematicGroupPost>> postsUiState; // UI state for posts
  final UiState<void> postDeleteUiState;
  final UiState<User?> userUiState;
  final List<ThematicGroupPost> posts; // List of posts
  final int page; // Current page for pagination
  final bool hasReachedMax; // Flag to check if max has been reached
  final UiState<Reaction> reactionUiState;

  @override
  List<Object> get props => [
        postsUiState,
        posts,
        page,
        hasReachedMax,
      ];

  PostsState copyWith({
    UiState<List<ThematicGroupPost>>? postsUiState,
    UiState<void>? postDeleteUiState,
    UiState<Reaction>? reactionUiState,
    List<ThematicGroupPost>? posts,
    int? page,
    bool? hasReachedMax,
    UiState<User?>? userUiState,
  }) {
    return PostsState(
      postsUiState: postsUiState ?? this.postsUiState,
      posts: posts ?? this.posts,
      page: page ?? this.page,
      postDeleteUiState: postDeleteUiState ?? this.postDeleteUiState,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      userUiState: userUiState ?? this.userUiState,
      reactionUiState: reactionUiState ?? this.reactionUiState,
    );
  }
}
