part of 'group_pending_posts_bloc.dart';

class GroupPendingPostsState extends Equatable {
  const GroupPendingPostsState({
    required this.groupId,
    this.postsUiState = const UiStateInitial(),
  });

  final String groupId;
  final UiState<List<ThematicGroupPost>> postsUiState;

  factory GroupPendingPostsState.create({
    required String groupId,
  }) {
    return GroupPendingPostsState(
      groupId: groupId,
    );
  }

  @override
  List<Object> get props => [
        groupId,
        postsUiState,
      ];

  GroupPendingPostsState copyWith({
    String? groupId,
    UiState<List<ThematicGroupPost>>? postsUiState,
  }) {
    return GroupPendingPostsState(
      groupId: groupId ?? this.groupId,
      postsUiState: postsUiState ?? this.postsUiState,
    );
  }
}
