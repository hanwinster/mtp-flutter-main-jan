part of 'user_manual_bloc.dart';

sealed class UserManualEvent extends Equatable {
  const UserManualEvent();
}

class UserManualFetched extends UserManualEvent {
  const UserManualFetched();

  @override
  List<Object> get props => [];
}