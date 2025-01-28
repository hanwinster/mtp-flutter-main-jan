part of 'group_post_comment_list_bloc.dart';

final class GroupPostCommentListState extends Equatable {
  const GroupPostCommentListState({
    required this.postId,
    required this.groupId,
    this.commentsUiState = const UiStateInitial(),
    this.reactionSubmissionUiState = const UiStateInitial(),
  });

  final String postId;
  final String groupId;
  final UiState<List<UiGroupPostCommentListItem>> commentsUiState;
  final UiState<NullValue> reactionSubmissionUiState;

  factory GroupPostCommentListState.create({
    required String postId,
    required String groupId,
  }) {
    return GroupPostCommentListState(
      postId: postId,
      groupId: groupId,
    );
  }

  @override
  List<Object> get props => [
        postId,
        groupId,
        commentsUiState,
        reactionSubmissionUiState,
      ];

  GroupPostCommentListState copyWith({
    String? postId,
    String? groupId,
    UiState<List<UiGroupPostCommentListItem>>? commentsUiState,
    UiState<NullValue>? reactionSubmissionUiState,
  }) {
    return GroupPostCommentListState(
      postId: postId ?? this.postId,
      groupId: groupId ?? this.groupId,
      commentsUiState: commentsUiState ?? this.commentsUiState,
      reactionSubmissionUiState: reactionSubmissionUiState ?? this.reactionSubmissionUiState,
    );
  }
}