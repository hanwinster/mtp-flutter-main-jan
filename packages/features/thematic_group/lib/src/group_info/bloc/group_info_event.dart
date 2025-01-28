part of 'group_info_bloc.dart';

sealed class GroupInfoEvent extends Equatable {
  const GroupInfoEvent();
}

class GroupInfoAuthStateFetched extends GroupInfoEvent {

  const GroupInfoAuthStateFetched();

  @override
  List<Object> get props => [];
}


class GroupInfoLeaveGroupRequested extends GroupInfoEvent {
  const GroupInfoLeaveGroupRequested(this.groupId);
  final String groupId;

  @override
  List<Object?> get props => [groupId];
}

class GroupInfoJoinGroupRequested extends GroupInfoEvent {
  const GroupInfoJoinGroupRequested(this.groupId);
  final String groupId;

  @override
  List<Object?> get props => [groupId];
}