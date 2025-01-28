part of 'post_details_bloc.dart';

final class PostDetailsState extends Equatable {
  const PostDetailsState({
    required this.postId,
    this.postUiState = const UiStateInitial(),
    this.categoriesUiState = const UiStateInitial(),
    this.filteredPostsUiState = const UiStateInitial(),
    this.commentsUiState = const UiStateInitial(),
    this.reactionSubmissionUiState = const UiStateInitial(),
    this.markAsReadSubmissionUiState = const UiStateInitial(),
    this.selectedCategory,
  });

  final String postId;
  final UiState<BlogPost> postUiState;
  final UiState<List<SelectableCategoryItemState>> categoriesUiState;
  final UiState<List<BlogPost>> filteredPostsUiState;
  final UiState<List<UiPostCommentItem>> commentsUiState;
  final UiState<String> reactionSubmissionUiState;
  final UiState<String> markAsReadSubmissionUiState;
  final BlogPostCategory? selectedCategory;

  factory PostDetailsState.create({required String postId}) {
    return PostDetailsState(
      postId: postId,
    );
  }

  @override
  List<Object?> get props => [
        postId,
        postUiState,
        categoriesUiState,
        filteredPostsUiState,
        commentsUiState,
        reactionSubmissionUiState,
        markAsReadSubmissionUiState,
        selectedCategory,
      ];

  PostDetailsState copyWith({
    String? postId,
    UiState<BlogPost>? postUiState,
    UiState<List<SelectableCategoryItemState>>? categoriesUiState,
    UiState<List<BlogPost>>? filteredPostsUiState,
    UiState<List<UiPostCommentItem>>? commentsUiState,
    UiState<String>? reactionSubmissionUiState,
    UiState<String>? markAsReadSubmissionUiState,
    ValueGetter<BlogPostCategory?>? selectedCategory,
  }) {
    return PostDetailsState(
      postId: postId ?? this.postId,
      postUiState: postUiState ?? this.postUiState,
      categoriesUiState: categoriesUiState ?? this.categoriesUiState,
      filteredPostsUiState: filteredPostsUiState ?? this.filteredPostsUiState,
      commentsUiState: commentsUiState ?? this.commentsUiState,
      reactionSubmissionUiState:
          reactionSubmissionUiState ?? this.reactionSubmissionUiState,
      markAsReadSubmissionUiState:
          markAsReadSubmissionUiState ?? this.markAsReadSubmissionUiState,
      selectedCategory:
          selectedCategory != null ? selectedCategory() : this.selectedCategory,
    );
  }
}
