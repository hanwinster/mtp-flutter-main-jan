part of 'group_rule_bloc.dart';

class GroupRuleState extends Equatable {
  const GroupRuleState({
    required this.groupId,
    this.groupRuleUiState = const UiStateInitial(),
    this.groupJoiningUiState = const UiStateInitial(),
  });

  final String groupId;
  final UiState<ThematicGroupRulesResponse> groupRuleUiState;
  final UiState<NullValue> groupJoiningUiState;

  factory GroupRuleState.create({
    required String groupId,
  }) {
    return GroupRuleState(
      groupId: groupId,
    );
  }

  @override
  List<Object> get props => [
        groupId,
        groupRuleUiState,
        groupJoiningUiState,
      ];

  GroupRuleState copyWith({
    String? groupId,
    UiState<ThematicGroupRulesResponse>? groupRuleUiState,
    UiState<NullValue>? groupJoiningUiState,
  }) {
    return GroupRuleState(
      groupId: groupId ?? this.groupId,
      groupRuleUiState: groupRuleUiState ?? this.groupRuleUiState,
      groupJoiningUiState: groupJoiningUiState ?? this.groupJoiningUiState,
    );
  }
}
