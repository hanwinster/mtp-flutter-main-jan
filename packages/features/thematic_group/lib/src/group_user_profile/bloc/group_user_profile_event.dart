part of 'group_user_profile_bloc.dart';

sealed class GroupUserProfileEvent extends Equatable {
  const GroupUserProfileEvent();
}

class GroupUserProfileApprovedPostsFetched extends GroupUserProfileEvent {
  const GroupUserProfileApprovedPostsFetched();

  @override
  List<Object> get props => [];
}

class GroupUserProfileCurrentUserFetched extends GroupUserProfileEvent {
  const GroupUserProfileCurrentUserFetched();

  @override
  List<Object> get props => [];
}