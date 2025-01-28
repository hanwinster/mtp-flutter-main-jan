part of 'post_detail_bloc.dart';

class PostDetailState extends Equatable {
  const PostDetailState({
    required this.postId,
    this.postUiState = const UiStateInitial(),
    this.postDeleteUiState = const UiStateInitial(),
    this.reactionUiState = const UiStateInitial(),
    this.commentsUiState = const UiStateInitial(),
    this.coments = const [],
    this.page = 1,
    this.hasReachedMax = false,
    this.userUiState = const UiStateInitial(),
  });

  final String postId;
  final UiState<ThematicGroupPost> postUiState;
  final UiState<User?> userUiState;
  final UiState<void> postDeleteUiState;
  final UiState<GroupPostDetailsData> commentsUiState; // UI state for posts
  final UiState<Reaction> reactionUiState;
  final List<ThematicGroupPostComment> coments; // List of posts
  final int page; // Current page for pagination
  final bool hasReachedMax; // Flag to check if max has been reached

  factory PostDetailState.create({required String postId}) {
    return PostDetailState(
      postId: postId,
    );
  }

  @override
  List<Object> get props =>
      [
        postId,
        postUiState,
        userUiState,
        postDeleteUiState,
        commentsUiState,
        reactionUiState,
        coments,
        page,
        hasReachedMax,
      ];

  PostDetailState copyWith({
    String? postId,
    UiState<ThematicGroupPost>? postUiState,
    UiState<User?>? userUiState,
    UiState<void>? postDeleteUiState,
    UiState<GroupPostDetailsData>? commentsUiState,
    UiState<Reaction>? reactionUiState,
    List<ThematicGroupPostComment>? coments,
    int? page,
    bool? hasReachedMax,
  }) {
    return PostDetailState(
      postId: postId ?? this.postId,
      postUiState: postUiState ?? this.postUiState,
      userUiState: userUiState ?? this.userUiState,
      postDeleteUiState: postDeleteUiState ?? this.postDeleteUiState,
      commentsUiState: commentsUiState ?? this.commentsUiState,
      reactionUiState: reactionUiState ?? this.reactionUiState,
      coments: coments ?? this.coments,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}