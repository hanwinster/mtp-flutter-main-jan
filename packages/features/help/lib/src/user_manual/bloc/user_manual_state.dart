part of 'user_manual_bloc.dart';

final class UserManualState extends Equatable {
  const UserManualState({
    this.userManualsUiState = const UiStateInitial(),
  });

  final UiState<List<UserManual>> userManualsUiState;

  factory UserManualState.create() {
    return const UserManualState();
  }

  @override
  List<Object> get props => [userManualsUiState];

  UserManualState copyWith({
    UiState<List<UserManual>>? userManualsUiState,
  }) {
    return UserManualState(
      userManualsUiState: userManualsUiState ?? this.userManualsUiState,
    );
  }
}