part of 'group_rule_bloc.dart';

sealed class GroupRuleEvent extends Equatable {
  const GroupRuleEvent();
}

class GroupRuleFetched extends GroupRuleEvent {
  const GroupRuleFetched();

  @override
  List<Object?> get props => [];
}

class GroupRuleJoinGroupRequested extends GroupRuleEvent {
  const GroupRuleJoinGroupRequested(this.groupId);

  final String groupId;

  @override
  List<Object?> get props => [groupId];
}
