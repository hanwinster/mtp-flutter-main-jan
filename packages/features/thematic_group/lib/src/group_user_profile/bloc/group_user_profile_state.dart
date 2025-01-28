part of 'group_user_profile_bloc.dart';

class GroupUserProfileState extends Equatable {
  const GroupUserProfileState({
    required this.groupId,
    this.currentUserUiState = const UiStateInitial(),
    this.postsUiState = const UiStateInitial(),
  });

  final String groupId;
  final UiState<User?> currentUserUiState;
  final UiState<PagedList<ThematicGroupPost>> postsUiState;

  factory GroupUserProfileState.create({
    required String groupId,
  }) {
    return GroupUserProfileState(
      groupId: groupId,
    );
  }

  int get totalUserPosts => postsUiState.dataOrNull?.total ?? 0;

  @override
  List<Object> get props => [
        groupId,
        postsUiState,
        currentUserUiState,
      ];

  GroupUserProfileState copyWith({
    String? groupId,
    UiState<PagedList<ThematicGroupPost>>? postsUiState,
    UiState<User?>? currentUserUiState,
  }) {
    return GroupUserProfileState(
      groupId: groupId ?? this.groupId,
      postsUiState: postsUiState ?? this.postsUiState,
      currentUserUiState: currentUserUiState ?? this.currentUserUiState,
    );
  }
}
