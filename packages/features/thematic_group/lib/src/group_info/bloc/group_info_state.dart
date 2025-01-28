part of 'group_info_bloc.dart';

final class GroupInfoState extends Equatable {
  const GroupInfoState({
    this.authState = AuthState.loggedOut,
    required this.group,
    required this.groupType,
    this.groupJoiningUiState = const UiStateInitial(),
    this.groupLeavingUiState = const UiStateInitial(),
  });

  final AuthState authState;
  final ThematicGroupListing group;
  final GroupType groupType;
  final UiState<NullValue> groupJoiningUiState;
  final UiState<String> groupLeavingUiState;

  factory GroupInfoState.create({
    required ThematicGroupListing group,
    required GroupType groupType,
  }) {
    return GroupInfoState(
      group: group,
      groupType: groupType,
    );
  }

  @override
  List<Object> get props => [
        authState,
        group,
        groupType,
        groupJoiningUiState,
        groupLeavingUiState,
      ];

  GroupInfoState copyWith({
    AuthState? authState,
    ThematicGroupListing? group,
    GroupType? groupType,
    UiState<NullValue>? groupJoiningUiState,
    UiState<String>? groupLeavingUiState,
  }) {
    return GroupInfoState(
      authState: authState ?? this.authState,
      group: group ?? this.group,
      groupType: groupType ?? this.groupType,
      groupJoiningUiState: groupJoiningUiState ?? this.groupJoiningUiState,
      groupLeavingUiState: groupLeavingUiState ?? this.groupLeavingUiState,
    );
  }
}
