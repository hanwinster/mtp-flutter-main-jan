part of 'group_pending_posts_bloc.dart';

sealed class GroupPendingPostsEvent extends Equatable {
  const GroupPendingPostsEvent();
}

class GroupPendingPostsFetched extends GroupPendingPostsEvent {
  const GroupPendingPostsFetched();

  @override
  List<Object> get props => [];
}