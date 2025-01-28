part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileUserFetched extends ProfileEvent {
  const ProfileUserFetched();

  @override
  List<Object> get props => [];
}
