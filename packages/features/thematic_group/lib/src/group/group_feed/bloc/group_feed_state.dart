part of 'group_feed_bloc.dart';

class GroupFeedState extends Equatable {
  const GroupFeedState({
    required this.groupId,
    this.groupUiState = const UiStateInitial(),
  });

  final String groupId;
  final UiState<ThematicGroupListing> groupUiState;

  factory GroupFeedState.create({
    required String groupId,
}) {
    return GroupFeedState(
      groupId: groupId,
    );
  }

  @override
  List<Object> get props => [groupId, groupUiState];

  GroupFeedState copyWith({
    String? groupId,
    UiState<ThematicGroupListing>? groupUiState,
  }) {
    return GroupFeedState(
      groupId: groupId ?? this.groupId,
      groupUiState: groupUiState ?? this.groupUiState,
    );
  }
}