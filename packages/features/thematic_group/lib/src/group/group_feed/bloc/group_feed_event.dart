part of 'group_feed_bloc.dart';

sealed class GroupFeedEvent extends Equatable {
  const GroupFeedEvent();
}

class GroupFeedGroupFetched extends GroupFeedEvent {
  const GroupFeedGroupFetched();

  @override
  List<Object> get props => [];
}
